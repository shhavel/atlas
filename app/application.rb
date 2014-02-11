require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  def initialize
    if Category.find(:all).size == 0 || Map.find(:all).size == 0
      Rhom::Rhom.database_full_reset(false, true)
      # PLACEHOLDER: categories & maps, i.e. categories.each{|category| Category.create(category) }
      [{'sign'=>"global",'name_ru'=>"География Крыма",'name_ua'=>"Географія Криму"}].each{|category| Category.create(category) }
      [{'category_sign'=>"global",'name_ru'=>"Крым из космоса",'name_ua'=>"Крим з космосу",'file'=>"6",'summary'=>"6",'pictures_list'=>"1"},{'category_sign'=>"global",'name_ru'=>"Административно-территориальное деление",'name_ua'=>"Адміністративно-територіальний поділ",'file'=>"8",'summary'=>"8"},{'category_sign'=>"global",'name_ru'=>"Физическая карта. Черное и Азовское моря",'name_ua'=>"Фізична карта. Чорне та Азовське моря",'file'=>"10",'summary'=>"10",'pictures_list'=>"1"},{'category_sign'=>"global",'name_ru'=>"Древний Крым",'name_ua'=>"Древній Крим",'file'=>"12_1",'summary'=>"12",'pictures_list'=>"1"},{'category_sign'=>"global",'name_ru'=>"Средневековый Крым",'name_ua'=>"Середньовічний Крим",'file'=>"12_2",'summary'=>"12",'pictures_list'=>"1"},{'category_sign'=>"global",'name_ru'=>"Тектоника",'name_ua'=>"Тектоніка",'file'=>"19",'summary'=>"19",'pictures_list'=>"2"},{'category_sign'=>"global",'name_ru'=>"Основные виды минеральных ресурсов. Природные ресурсы подземных вод",'name_ua'=>"Основні види мінеральних ресурсів. Природні ресурси підземних вод",'file'=>"24",'summary'=>"24",'pictures_list'=>"2"},{'category_sign'=>"global",'name_ru'=>"Иностранный туризм",'name_ua'=>"Іноземний туризм",'file'=>"67_1",'summary'=>"67_1",'pictures_list'=>"4"},{'category_sign'=>"global",'name_ru'=>"Природно-заповедные территории",'name_ua'=>"Природно-заповідні території",'file'=>"75_1",'summary'=>"75_1",'pictures_list'=>"5"}].each{|map| Map.create(map) }
    end
    if Bill.find(:all).size == 0
      code = (0...6).map{(65 + rand(26)).chr }.join
      token =  (0...32).map.with_index{|i| ('a'..'z').to_a.concat(('0'..'9').to_a)[rand(36)] }.join
      Bill.create({'code' => code, 'token' => token, 'paid' => 0})
    end
    if Control.find(:all).size == 0
      # PLACEHOLDER: default_lang, e.g. default_lang = 'ru'
      default_lang = 'ru'
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
