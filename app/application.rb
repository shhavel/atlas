require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  def initialize
    if Category.find(:all).size == 0 || Map.find(:all).size == 0
      Rhom::Rhom.database_full_reset(false, true)
      # PLACEHOLDER: categories & maps, i.e. categories.each{|category| Category.create(category) }
      [{'sign'=>"global",'name_ua'=>"Географія, 3-4 клас",'name_ru'=>"География, 3-4 класс"}].each{|category| Category.create(category) }
      [{'category_sign'=>"global",'name_ua'=>"ДЕРЖАВНІ СИМВОЛИ УКРАЇНИ",'name_ru'=>"ГОСУДАРСТВЕННЫЕ СИМВОЛЫ УКРАИНЫ",'file'=>"01",'summary'=>"01",'pictures_list'=>"01",'questionnaire'=>"01"},{'category_sign'=>"global",'name_ua'=>"КУЛЬТУРНА СПАДЩИНА НАРОДУ",'name_ru'=>"КУЛЬТУРНОЕ НАСЛЕДИЕ НАРОДА",'file'=>"02_03",'summary'=>"02",'pictures_list'=>"02",'questionnaire'=>"01"},{'category_sign'=>"global",'name_ua'=>"ЗОРЯНЕ НЕБО ПІВНІЧНОЇ ПІВКУЛІ. СОНЯЧНА СИСТЕМА",'name_ru'=>"ЗВЕЗДНОЕ НЕБО Северного полушария. СОЛНЕЧНАЯ СИСТЕМА",'file'=>"04_05",'summary'=>"0304",'pictures_list'=>"03",'questionnaire'=>"01"},{'category_sign'=>"global",'name_ua'=>"ЗЕМЛЯ – ПЛАНЕТА СОНЯЧНОЇ СИСТЕМИ. ГЛОБУС – МОДЕЛЬ ЗЕМЛІ. РІЧНИЙ РУХ ЗЕМЛІ. ДОБОВИЙ РУХ ЗЕМЛІ",'name_ru'=>"ЗЕМЛЯ - ПЛАНЕТА СОЛНЕЧНОЙ СИСТЕМЫ. ГЛОБУС - МОДЕЛЬ ЗЕМЛИ. ГОДОВОЙ ДВИЖЕНИЕ ЗЕМЛИ. СУТОЧНЫЙ ДВИЖЕНИЕ ЗЕМЛИ",'file'=>"06",'questionnaire'=>"01"},{'category_sign'=>"global",'name_ua'=>"ГОРИЗОНТ. ПОЛОЖЕННЯ СОНЦЯ НА НЕБОСХИЛІ В РІЗНІ ПОРИ РОКУ",'name_ru'=>"ГОРИЗОНТ. ПОЛОЖЕНИЕ СОЛНЦА НА НЕБОСКЛОНЕ В РАЗНЫЕ ВРЕМЕНА ГОДА",'file'=>"07",'questionnaire'=>"01"},{'category_sign'=>"global",'name_ua'=>"ПОНЯТТЯ СТОРІН ГОРИЗОНТУ. ОРІЄНТУВАННЯ НА МІСЦЕВОСТІ",'name_ru'=>"ПОНЯТИЕ сторон горизонта. Ориентирование на местности",'file'=>"08",'questionnaire'=>"01"},{'category_sign'=>"global",'name_ua'=>"ПОНЯТТЯ ПРО ПЛАН. ПОНЯТТЯ ПРО МАСШТАБ",'name_ru'=>"ПОНЯТИЕ ПЛАН. ПОНЯТИЕ МАСШТАБ",'file'=>"09",'questionnaire'=>"01"},{'category_sign'=>"global",'name_ua'=>"ФІЗИЧНА КАРТА ПІВКУЛЬ",'name_ru'=>"ФИЗИЧЕСКАЯ КАРТА ПОЛУШАРИЙ",'file'=>"10_11",'questionnaire'=>"01"},{'category_sign'=>"global",'name_ua'=>"ПРИРОДНІ ЗОНИ І ТВАРИННИЙ СВІТ ЗЕМЛІ",'name_ru'=>"ПРИРОДНЫЕ ЗОНЫ И ЖИВОТНЫЙ МИР ЗЕМЛИ",'file'=>"12_13",'pictures_list'=>"07",'questionnaire'=>"01"},{'category_sign'=>"global",'name_ua'=>"ФІЗИЧНА КАРТА УКРАЇНИ. ФОРМИ ЗЕМНОЇ ПОВЕРХНІ",'name_ru'=>"ФИЗИЧЕСКАЯ КАРТА УКРАИНЫ. ФОРМЫ ЗЕМНОЙ ПОВЕРХНОСТИ",'file'=>"14_15",'summary'=>"05",'pictures_list'=>"05",'questionnaire'=>"01"},{'category_sign'=>"global",'name_ua'=>"ПРИРОДНІ ЗОНИ УКРАЇНИ. РОСЛИННИЙ І ТВАРИННИЙ СВІТ",'name_ru'=>"ПРИРОДНЫЕ ЗОНЫ УКРАИНЫ. РАСТИТЕЛЬНЫЙ И ЖИВОТНЫЙ МИР",'file'=>"16_17",'summary'=>"06",'pictures_list'=>"06",'questionnaire'=>"01"},{'category_sign'=>"global",'name_ua'=>"НАСЕЛЕННЯ УКРАЇНИ. ЗЕМЛІ Й ОБЛАСТІ",'name_ru'=>"НАСЕЛЕНИЯ УКРАИНЫ. ЗЕМЛИ И ОБЛАСТИ",'file'=>"18_19",'questionnaire'=>"01"},{'category_sign'=>"global",'name_ua'=>"ГОСПОДАРСТВО УКРАЇНИ",'name_ru'=>"ХОЗЯЙСТВО УКРАИНЫ",'file'=>"20",'questionnaire'=>"01"}].each{|map| Map.create(map) }
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
