require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  def initialize
    if Category.find(:all).size == 0 || Map.find(:all).size == 0
      Rhom::Rhom.database_full_reset(false, true)
      # PLACEHOLDER: categories & maps, i.e. categories.each{|category| Category.create(category) }
      [{'sign'=>"global",'name_ua'=>"Всесвітня історія 10 клас",'name_ru'=>"Всемирная история 10 класс"}].each{|category| Category.create(category) }
      [{'category_sign'=>"global",'name_ua'=>"ЄВРОПА НАПЕРЕДОДНІ ПЕРШОЇ СВІТОВОЇ ВІЙНИ",'name_ru'=>"ЕВРОПА НАКАНУНЕ ПЕРВОЙ МИРОВОЙ ВОЙНЫ",'file'=>"1",'summary'=>"1",'pictures_list'=>"1",'questionnaire'=>"01"},{'category_sign'=>"global",'name_ua'=>"ПЕРША СВІТОВА ВІЙНА (події 1914 – 1915 рр.)",'name_ru'=>"ПЕРВАЯ МИРОВАЯ ВОЙНА (события 1914 - 1915 гг)",'file'=>"2",'summary'=>"2",'pictures_list'=>"2",'questionnaire'=>"02"},{'category_sign'=>"global",'name_ua'=>"ПЕРША СВІТОВА ВІЙНА (події 1916 – 1918 рр.)",'name_ru'=>"ПЕРВАЯ МИРОВАЯ ВОЙНА (события 1916 - 1918 гг)",'file'=>"3",'summary'=>"3",'pictures_list'=>"3",'questionnaire'=>"03"},{'category_sign'=>"global",'name_ua'=>"ЄВРОПА ПІСЛЯ ПЕРШОЇ СВІТОВОЇ ВІЙНИ: ТЕРИТОРІАЛЬНІ ЗМІНИ і ПОЛІТИЧНИЙ РОЗВИТОК (1919 – 1923 рр.)",'name_ru'=>"ЕВРОПА ПОСЛЕ ПЕРВОЙ МИРОВОЙ ВОЙНЫ: ТЕРРИТОРИАЛЬНЫЕ ИЗМЕНЕНИЯ и ПОЛИТИЧЕСКОЕ РАЗВИТИЕ (1919 - 1923 рр.)",'file'=>"4",'summary'=>"4",'pictures_list'=>"4",'questionnaire'=>"04"},{'category_sign'=>"global",'name_ua'=>"НАРОДИ ЦЕНТРАЛЬНОЇ та СХІДНОЇ ЄВРОПИ в МІЖВОЄННИЙ ПЕРІОД",'name_ru'=>"НАРОДЫ ЦЕНТРАЛЬНОЙ и ВОСТОЧНОЙ ЕВРОПЫ в межвоенный период",'file'=>"5",'questionnaire'=>"05"},{'category_sign'=>"global",'name_ua'=>"РЕВОЛЮЦІЯ і ГРОМАДЯНСЬКА ВІЙНА в РОСІЇ",'name_ru'=>"РЕВОЛЮЦИЯ и ГРАЖДАНСКАЯ ВОЙНА В РОССИИ",'file'=>"6",'summary'=>"6",'pictures_list'=>"6",'questionnaire'=>"06"},{'category_sign'=>"global",'name_ua'=>"УТВОРЕННЯ СОЮЗУ РАДЯНСЬКИХ СОЦІАЛІСТИЧНИХ РЕСПУБЛІК. РАДЯНСЬКИЙ СОЮЗ у 1924 – 1939 роках",'name_ru'=>"ОБРАЗОВАНИЯ СОЮЗА СОВЕТСКИХ СОЦИАЛИСТИЧЕСКИХ РЕСПУБЛИК. СОВЕТСКИЙ СОЮЗ в 1924 - 1939 годах",'file'=>"7",'summary'=>"7",'pictures_list'=>"7",'questionnaire'=>"07"},{'category_sign'=>"global",'name_ua'=>"ЄВРОПА в 1924 – 1932 роках",'name_ru'=>"ЕВРОПА в 1924 - 1932 годах",'file'=>"8",'summary'=>"8",'pictures_list'=>"8",'questionnaire'=>"08"},{'category_sign'=>"global",'name_ua'=>"ЄВРОПА в 1933 – 1939 роках",'name_ru'=>"ЕВРОПА в 1933 - 1939 годах",'file'=>"9",'summary'=>"9",'pictures_list'=>"9"},{'category_sign'=>"global",'name_ua'=>"СВІТ у 1920 – 1939 роках",'name_ru'=>"МИР в 1920 - 1939 годах",'file'=>"10"},{'category_sign'=>"global",'name_ua'=>"КРАЇНИ ПЕРЕДНЬОЇ АЗІЇ та ПІВНІЧНО-СХІДНОЇ АФРИКИ в МІЖВОЄННИЙ ПЕРІОД",'name_ru'=>"СТРАНЫ ПЕРЕДНЕЙ АЗИИ и СЕВЕРО-ВОСТОЧНОЙ АФРИКИ в межвоенный период",'file'=>"11",'summary'=>"11",'pictures_list'=>"11"},{'category_sign'=>"global",'name_ua'=>"КРАЇНИ ПІВДЕННОЇ та СХІДНОЇ АЗІЇ в МІЖВОЄННИЙ ПЕРІОД",'name_ru'=>"СТРАНЫ ЮЖНОЙ и ВОСТОЧНОЙ АЗИИ в межвоенный период",'file'=>"12",'summary'=>"12",'pictures_list'=>"12"},{'category_sign'=>"global",'name_ua'=>"США та КРАЇНИ ЛАТИНСЬКОЇ АМЕРИКИ в МІЖВОЄННИЙ ПЕРІОД. ДЕРЖАВИ-АГРЕСОРИ та ПЛАНИ ПЕРЕРОЗПОДІЛУ СВІТУ НАПЕРЕДОДНІ ДРУГОЇ СВІТОВОЇ ВІЙНИ",'name_ru'=>"США и страны Латинской Америки в межвоенный период. Государства-агрессоры и ПЛАНЫ перераспределение МИРА НАКАНУНЕ ВТОРОЙ МИРОВОЙ ВОЙНЫ",'file'=>"13",'summary'=>"13",'pictures_list'=>"13"}].each{|map| Map.create(map) }
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
