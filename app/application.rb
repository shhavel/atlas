require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  def initialize
    if Category.find(:all).size == 0 || Map.find(:all).size == 0
      Rhom::Rhom.database_full_reset(false, true)
      # PLACEHOLDER: categories & maps, i.e. categories.each{|category| Category.create(category) }
      [{'sign'=>"global",'name_ua'=>"Регіони України",'name_ru'=>"Регионы Украины"}].each{|category| Category.create(category) }
      [{'category_sign'=>"global",'name_ua'=>"АР Крим",'name_ru'=>"АР Крым",'file'=>"1",'summary'=>"1",'pictures_list'=>"1"},{'category_sign'=>"global",'name_ua'=>"Вінницька обл.",'name_ru'=>"Винницкая обл.",'file'=>"2",'summary'=>"2",'pictures_list'=>"2"},{'category_sign'=>"global",'name_ua'=>"Волинська обл.",'name_ru'=>"Волынская обл.",'file'=>"3",'summary'=>"3",'pictures_list'=>"3"},{'category_sign'=>"global",'name_ua'=>"Дніпропетровська обл.",'name_ru'=>"Днепропетровская обл.",'file'=>"4",'summary'=>"4",'pictures_list'=>"4"},{'category_sign'=>"global",'name_ua'=>"Донецька обл.",'name_ru'=>"Донецкая обл.",'file'=>"5",'summary'=>"5",'pictures_list'=>"5"},{'category_sign'=>"global",'name_ua'=>"Житомирська обл.",'name_ru'=>"Житомирская обл.",'file'=>"6",'summary'=>"6",'pictures_list'=>"6"},{'category_sign'=>"global",'name_ua'=>"Закарпатська обл.",'name_ru'=>"Закарпатская обл.",'file'=>"7",'summary'=>"7",'pictures_list'=>"7"},{'category_sign'=>"global",'name_ua'=>"Запорізька обл.",'name_ru'=>"Запорожская обл.",'file'=>"8",'summary'=>"8",'pictures_list'=>"8"},{'category_sign'=>"global",'name_ua'=>"Івано-Франківська обл.",'name_ru'=>"Ивано-Франковская обл.",'file'=>"9",'summary'=>"9",'pictures_list'=>"9"},{'category_sign'=>"global",'name_ua'=>"Київська обл.",'name_ru'=>"Киевская обл.",'file'=>"10",'summary'=>"10",'pictures_list'=>"10"},{'category_sign'=>"global",'name_ua'=>"Кіровоградська обл.",'name_ru'=>"Кировоградская обл.",'file'=>"11",'summary'=>"11",'pictures_list'=>"11"},{'category_sign'=>"global",'name_ua'=>"Луганська обл.",'name_ru'=>"Луганская обл.",'file'=>"12",'summary'=>"12",'pictures_list'=>"12"},{'category_sign'=>"global",'name_ua'=>"Львівська обл.",'name_ru'=>"Львовская обл.",'file'=>"13",'summary'=>"13",'pictures_list'=>"13"},{'category_sign'=>"global",'name_ua'=>"Миколаївська обл.",'name_ru'=>"Николаевская обл.",'file'=>"14",'summary'=>"14",'pictures_list'=>"14"},{'category_sign'=>"global",'name_ua'=>"Одеська обл.",'name_ru'=>"Одесская обл.",'file'=>"15",'summary'=>"15",'pictures_list'=>"15"},{'category_sign'=>"global",'name_ua'=>"Полтавська обл.",'name_ru'=>"Полтавская обл.",'file'=>"16",'summary'=>"16",'pictures_list'=>"16"},{'category_sign'=>"global",'name_ua'=>"Рівненська обл.",'name_ru'=>"Ровенская обл.",'file'=>"17",'summary'=>"17",'pictures_list'=>"17"},{'category_sign'=>"global",'name_ua'=>"Сумська обл.",'name_ru'=>"Сумская обл.",'file'=>"18",'summary'=>"18",'pictures_list'=>"18"},{'category_sign'=>"global",'name_ua'=>"Тернопільська обл.",'name_ru'=>"Тернопольская обл.",'file'=>"19",'summary'=>"19",'pictures_list'=>"19"},{'category_sign'=>"global",'name_ua'=>"Харківська обл.",'name_ru'=>"Харьковская обл.",'file'=>"20",'summary'=>"20",'pictures_list'=>"20"},{'category_sign'=>"global",'name_ua'=>"Херсонська обл.",'name_ru'=>"Херсонская обл.",'file'=>"21",'summary'=>"21",'pictures_list'=>"21"},{'category_sign'=>"global",'name_ua'=>"Хмельницька обл.",'name_ru'=>"Хмельницкая обл.",'file'=>"22",'summary'=>"22",'pictures_list'=>"22"},{'category_sign'=>"global",'name_ua'=>"Черкаська обл.",'name_ru'=>"Черкасская обл.",'file'=>"23",'summary'=>"23",'pictures_list'=>"23"},{'category_sign'=>"global",'name_ua'=>"Чернівецька обл.",'name_ru'=>"Черновицкая обл.",'file'=>"24",'summary'=>"24",'pictures_list'=>"24"},{'category_sign'=>"global",'name_ua'=>"Чернігівська обл.",'name_ru'=>"Черниговская обл.",'file'=>"25",'summary'=>"25",'pictures_list'=>"25"},{'category_sign'=>"global",'name_ua'=>"Київ",'name_ru'=>"Киев",'file'=>"26",'summary'=>"26",'pictures_list'=>"26"},{'category_sign'=>"global",'name_ua'=>"Севастополь",'name_ru'=>"Севастополь",'file'=>"27",'summary'=>"27",'pictures_list'=>"27"}].each{|map| Map.create(map) }
    end
    if Control.find(:all).size == 0
      system_lang = nil
      if ['uk', 'ru', 'en'].include?(System.get_locale)
        system_lang = System.get_locale == 'uk' ? 'ua' : System.get_locale
      end
      # PLACEHOLDER: default_lang, e.g. default_lang = 'ru'
      default_lang = 'ua'
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
