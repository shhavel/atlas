require 'rho/rhocontroller'
require 'helpers/browser_helper'
require 'rexml/document'
require 'net/http'
require 'thread'
require 'timeout'
require 'uri'

class MapController < Rho::RhoController
  include BrowserHelper

  # GET /Map/{1}
  def show
    @map = Map.find(@params['id'])
    if !is_free? && unpaid?
      render :action => :unpaid, :back => url_for(:controller => :Category, :action => :index)
    elsif @map
      Rho::NativeToolbar.create(:background_color => bgcolor, :buttons => toolbar(true))
      render :action => :show, :back => url_for(:controller => :Category, :action => :show, :id => @map.category.object, :query => { :lang => lang })
    else
      redirect :controller => :Category, :action => :index
    end
  end

  def summary
    @map = Map.find(@params['id'])
    if @map
      @summary = File.read(File.join(File.expand_path(File.dirname(__FILE__)), "summary/#{lang}/#{@map.summary}.htm"))
      Rho::NativeToolbar.create(:background_color => bgcolor, :buttons => toolbar)
      render :action => :summary, :back => url_for(:action => :show, :id => @map.object)
    else
      redirect :controller => :Category, :action => :index
    end
  end

  def gallery
    @map = Map.find(@params['id'])
    if @map
      file = File.read(File.join(File.expand_path(File.dirname(__FILE__)), "pictures_list/#{lang}/#{@map.pictures_list}.xml"))
      doc = REXML::Document.new(file)
      @gallery_title = doc.elements['List'].attributes['Title']
      @photos = {}
      doc.elements.each('List/Item') do |el|
        @photos["/public/photos/#{@map.pictures_list}/#{el.attributes['FileName']}.#{photo_file_ext}"] = el.attributes['Caption'].strip.gsub("'", '')
      end
      Rho::NativeToolbar.create(:background_color => bgcolor, :buttons => toolbar)
      render :action => :gallery, :back => url_for(:action => :show, :id => @map.object)
    else
      redirect :controller => :Category, :action => :index
    end
  end

  def question
    @map = Map.find(@params['id'])
    if @map
      prepare_questions_and_answers
      Rho::NativeToolbar.create(:background_color => bgcolor, :buttons => toolbar)
      render :action => :question, :back => url_for(:action => :show, :id => @map.object)
    else
      redirect :controller => :Category, :action => :index
    end
  end

  def resume
    @map = Map.find(@params['id'])
    if @map
      prepare_questions_and_answers
      @count = @variants.each_with_index.count do |question_variants, num|
        question_variants.each_with_index.count do |variant, idx|
          variant[:flag] == @answers[num][idx]
        end == question_variants.count
      end
      Rho::NativeToolbar.create(:background_color => bgcolor, :buttons => toolbar)
      render :action => :resume, :back => url_for(:action => :question, :id => @map.object)
    else
      redirect :controller => :Category, :action => :index
    end
  end

  def zoom
    WebView.execute_js <<-JS
      $('div.map').lhpMegaImgViewer('zoom');
      setTimeout("$('div.map').lhpMegaImgViewer('zoomStop');", #{zoom_step});
    JS
  end
  def unzoom
    WebView.execute_js <<-JS
      $('div.map').lhpMegaImgViewer('unzoom');
      setTimeout("$('div.map').lhpMegaImgViewer('zoomStop');", #{zoom_step});
    JS
  end

private

  def prepare_questions_and_answers
    file = File.read(File.join(File.expand_path(File.dirname(__FILE__)), "questionnaire/#{lang}/#{@map.questionnaire}.xml"))
    doc = REXML::Document.new(file)
    @testing_name = doc.elements['testing'].attributes['name']
    @questions = []
    @variants = []
    @default_answers = []
    doc.elements.each('testing/question') do |question|
      @questions << question.attributes['text']
      @variants << []
      @default_answers << []
      question.each_element do |anw|
        @variants.last << { :flag => anw.attributes['flag'], :text => anw.attributes['text'] }
        @default_answers.last << "0"
      end
    end

    @num = (@params['num'] || 0).to_i
    @params['answers'] = @params['a'] if @params['a']
    if @params['answers']
      @answers = @params['answers'].values
    else
      @answers = @default_answers
    end
    if @params['current_answer']
      @current_answer = @params['current_answer'].map(&:to_i)
      @answers[@num - 1] = ['0'] * @answers[@num - 1].size
      @params['current_answer'].map(&:to_i).each{|i| @answers[@num - 1][i] = '1' }
    end
  end

  def is_free?
    if Category.find(:all).size > 1
      return true if @map.category_sign == Category.find(:all).first.sign
    else
      return true if Map.find(:all, :page => 1, :per_page => 2).map(&:object).include?(@map.object)
    end
    return false
  end

  def unpaid?
    @bill = Bill.find(:all).first
    return false if @bill.paid == 1
    uri = URI("http://ukrmap.su/check.php")
    params = { :code => @bill.code, :token => @bill.token }
    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get_response(uri)
    if res.is_a?(Net::HTTPSuccess)
      @check = Rho::JSON.parse(res.body)
      if @check["ok"] == true
        @bill.update_attributes({"paid" => 1})
        return false
      else
        return true
      end
    else
      return true
    end
  rescue
    return true
  end

  def toolbar(with_zoom = false)
    toolbar = [
      {:action => :back, :reload => true},
      {:action => "/app/Map/show/#{@map.object}", :icon => "/public/images/toolbar/globe_2_icon&#{icon_size}.png", :reload => true}
    ]
    if @map.summary
      toolbar << {:action => "/app/Map/summary/#{@map.object}", :icon => "/public/images/toolbar/doc_lines_icon&#{icon_size}.png", :reload => true}
    end
    if @map.pictures_list
      toolbar << {:action => "/app/Map/gallery/#{@map.object}", :icon => "/public/images/toolbar/picture_icon&#{icon_size}.png", :reload => true}
    end
    if @map.questionnaire
      toolbar << {:action => "/app/Map/question/#{@map.object}", :icon => "/public/images/toolbar/spechbubble_2_icon&#{icon_size}.png", :reload => true}
    end
    toolbar << {:action => :separator}
    if with_zoom
      toolbar.concat [
        {:action => "callback:/app/Map/zoom", :icon => "/public/images/toolbar/round_plus_icon&#{icon_size}.png"},
        {:action => "callback:/app/Map/unzoom", :icon => "/public/images/toolbar/round_minus_icon&#{icon_size}.png"}
      ]
    end
    if show_controls_icon?
      toolbar << {:action => "/app/Control/index?referer=/app/Map/show/#{@map.object}", :icon => "/public/images/toolbar/cogs_icon&#{icon_size}.png", :reload => true}
    end
    toolbar
  end

  def lang
    @lang ||= Control.find(:all, :conditions => {'name' => 'lang'}).first.value
  end

  def zoom_step
    @zoom_step ||= Control.find(:all, :conditions => {'name' => 'zoom_step'}).first.value
  end

  def show_controls_icon?
    @show_controls_icon ||= Control.find(:all, :conditions => {'name' => 'show_controls_icon'}).first.checked?
  end

  def icon_size
    @icon_size ||= begin
      size = Control.find(:all, :conditions => {'name' => 'icon_size'}).first.value
      size == 'small' ? '24' : '32'
    end
  end

  def bgcolor
    # PLACEHOLDER: bgcolor, e.g. 0x0B8A45
    0xDDAC34
  end

  def photo_file_ext
    # PLACEHOLDER: photos (gallery) files ext, e.g. 'png'
    'jpg'
  end
end
