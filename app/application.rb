require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  def initialize
    if Category.find(:all).size == 0 || Map.find(:all).size == 0
      Rhom::Rhom.database_full_reset(false, true)
      # PLACEHOLDER: categories & maps, i.e. categories.each{|category| Category.create(category) }
      [{'sign'=>"global",'name_ru'=>"География Крыма",'name_ua'=>"Географія Криму",'name_en'=>"Geography of Crimea",}].each{|category| Category.create(category) }
      [{'category_sign'=>"global",'name_ru'=>"Крым из космоса",'name_ua'=>"Крим з космосу",'name_en'=>"Crimea from space",'file'=>"6",'summary'=>"6",'pictures_list'=>"1",},{'category_sign'=>"global",'name_ru'=>"Административно-территориальное деление",'name_ua'=>"Адміністративно-територіальний поділ",'name_en'=>"Political division",'file'=>"8",'summary'=>"8",},{'category_sign'=>"global",'name_ru'=>"Физическая карта. Черное и Азовское моря",'name_ua'=>"Фізична карта. Чорне та Азовське моря",'name_en'=>"Physical map. Black and Azov Seas",'file'=>"10",'summary'=>"10",'pictures_list'=>"1",},{'category_sign'=>"global",'name_ru'=>"Древний Крым",'name_ua'=>"Древній Крим",'name_en'=>"Ancient Crimea",'file'=>"12_1",'summary'=>"12",'pictures_list'=>"1",},{'category_sign'=>"global",'name_ru'=>"Средневековый Крым",'name_ua'=>"Середньовічний Крим",'name_en'=>"Medieval Crimea",'file'=>"12_2",'summary'=>"12",'pictures_list'=>"1",},{'category_sign'=>"global",'name_ru'=>"Тектоника",'name_ua'=>"Тектоніка",'name_en'=>"Tectonics",'file'=>"19",'summary'=>"19",'pictures_list'=>"2",},{'category_sign'=>"global",'name_ru'=>"Основные виды минеральных ресурсов. Природные ресурсы подземных вод",'name_ua'=>"Основні види мінеральних ресурсів. Природні ресурси підземних вод",'name_en'=>"The main types of mineral resources. Natural groundwater resources",'file'=>"24",'summary'=>"24",'pictures_list'=>"2",},{'category_sign'=>"global",'name_ru'=>"Иностранный туризм",'name_ua'=>"Іноземний туризм",'name_en'=>"Foreign tourism",'file'=>"67_1",'summary'=>"67_1",'pictures_list'=>"4",},{'category_sign'=>"global",'name_ru'=>"Природно-заповедные территории",'name_ua'=>"Природно-заповідні території",'name_en'=>"Natural protected areas",'file'=>"75_1",'summary'=>"75_1",'pictures_list'=>"5",}].each{|map| Map.create(map) }
    end
    if Control.find(:all).size == 0
      system_lang = nil
      if ['uk', 'ru', 'en'].include?(System.get_locale)
        system_lang = System.get_locale == 'uk' ? 'ua' : System.get_locale
      end
      # PLACEHOLDER: default_lang, e.g. default_lang = 'ru'
      default_lang = 'ru'
      Control.create({'name' => 'lang', 'value' => (system_lang || default_lang), 'type' => 'select', 'values_str' => '["ua","ru","en"]'})
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
