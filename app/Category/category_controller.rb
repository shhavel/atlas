require 'rho/rhocontroller'
require 'helpers/browser_helper'

class CategoryController < Rho::RhoController
  include BrowserHelper

  # GET /Category
  def index
    Rho::NativeToolbar.remove
    @categories = Category.find(:all)
    render #:back => '/app'
  end

  # GET /Category/{1}
  def show
    Rho::NativeToolbar.remove
    @category = Category.find(@params['id'])
    if @category
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end
end
