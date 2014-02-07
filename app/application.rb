require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  def initialize
    if Category.find(:all).size == 0 || Map.find(:all).size == 0
      Rhom::Rhom.database_full_reset(false, true)
      # PLACEHOLDER: categories & maps, i.e. categories.each{|category| Category.create(category) }
    end
    if Bill.find(:all).size == 0
      code = (0...6).map{(65 + rand(26)).chr }.join
      token =  (0...32).map.with_index{|i| ('a'..'z').to_a.concat(('0'..'9').to_a)[rand(36)] }.join
      Bill.create({'code' => code, 'token' => token, 'paid' => 0})
    end
    if Control.find(:all).size == 0
      # PLACEHOLDER: default_lang, e.g. default_lang = 'ru'
      Control.create({'name' => 'lang', 'value' => default_lang, 'type' => 'select', 'values_str' => '["ru","ua"]'})
      Control.create({'name' => 'icon_size', 'value' => (System::get_property('platform') == 'APPLE' ? 'small' : 'normal'), 'type' => 'select', 'values_str' => '["small","normal"]'})
      Control.create({'name' => 'zoom_step', 'value' => '70', 'type' => 'range', 'values_str' => '{"min":50,"max":100,"step":1}'})
      Control.create({'name' => 'show_controls_icon', 'value' => '1', 'type' => 'checkbox'})
    end

    # Tab items are loaded left->right, @tabs[0] is leftmost tab in the tab-bar
    # Super must be called *after* settings @tabs!
    @tabs = nil
    #To remove default toolbar uncomment next line:
    @@toolbar = nil
    super

    # Uncomment to set sync notification callback to /app/Settings/sync_notify.
    # SyncEngine::set_objectnotify_url("/app/Settings/sync_notify")
    SyncEngine.set_notification(-1, "/app/Settings/sync_notify", '')
  end
end
