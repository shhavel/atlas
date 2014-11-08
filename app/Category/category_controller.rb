require 'rho/rhocontroller'
require 'helpers/browser_helper'

class CategoryController < Rho::RhoController
  include BrowserHelper

  # GET /Category
  def index
    set_lang
    Rho::NativeToolbar.remove
    @categories = Category.find(:all)
    if Category.find(:all).size > 1
      render #:back => '/app'
    else
      @category = Category.find(:all).first
      redirect :action => :show, :id => @category.object
    end
  end

  # GET /Category/{1}
  def show
    set_lang
    Rho::NativeToolbar.remove
    @category = Category.find(@params['id'])
    if @category
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

private

  def set_lang
    @control_lang ||= Control.find(:all, :conditions => {'name' => 'lang'}).first
    if @params['lang'] && @params['lang'] != @control_lang.value && ['ua', 'ru', 'en'].include?(@params['lang'])
      @control_lang.update_attributes({'value' => @params['lang']})
      Control.lang = @params['lang']
    end
    @lang = @control_lang.value
    @next_lang = if @lang == 'ua'
      'ru'
    elsif @lang == 'ru'
      'en'
    else
      'ua'
    end
  end
end
