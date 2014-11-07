require 'rho/rhocontroller'
require 'helpers/browser_helper'

class ControlController < Rho::RhoController
  include BrowserHelper

  # GET /Control
  def index
    Rho::NativeToolbar.remove
    @controls = Control.find(:all)
    render :action => :change, :back => @params['referer']
  end

  # POST /Control/change
  def change
    Rho::NativeToolbar.remove
    @controls = Control.find(:all)
    @controls.each do |control|
      if control.type == 'checkbox'
        control.update_attributes({'value' => (@params[control.name] ? '1' : '0' )})
      else
        control.update_attributes({'value' => @params[control.name]}) if @params[control.name]
      end
    end
    Control.lang = @params['lang'] if @params['lang']
    render :back => @params['referer']
  end
end
