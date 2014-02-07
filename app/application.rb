require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  def initialize
    if Category.find(:all).size == 0 || Map.find(:all).size == 0
      Rhom::Rhom.database_full_reset(false, true)
      # PLACEHOLDER: categories & maps, i.e. categories.each{|category| Category.create(category) }
      [{'sign'=>"war",'name_ua'=>"Друга світова війна",'name_ru'=>"Вторая мировая война"},{'sign'=>"west",'name_ua'=>"Країни Заходу, Близького і Середнього Сходу",'name_ru'=>"Страны Запада, Ближнего и Среднего Востока"},{'sign'=>"ussr",'name_ua'=>"СРСР, країни Центральної та Східної Європи",'name_ru'=>"СССР, страны Центральной и Восточной Европы"},{'sign'=>"asia",'name_ua'=>"Країни Азії і Африки",'name_ru'=>"Страны Азии и Африки"},{'sign'=>"afterwar",'name_ua'=>"Світ у повоєнні та теперішні часи",'name_ru'=>"Мир в послевоенные и нынешние времена"}].each{|category| Category.create(category) }
      [{'category_sign'=>"war",'name_ua'=>"Друга світова війна (події 1 вересня 1939 – 21 червня 1941 рр.)",'name_ru'=>"Вторая мировая война (события 1 сентября 1939 - 21 июня 1941)",'file'=>"1",'legend'=>"Main",'pictures_list'=>"1",'questionnaire'=>"1"},{'category_sign'=>"war",'name_ua'=>"Друга світова війна (події 22 червня 1941 – 18 листопада 1942 рр.)",'name_ru'=>"Вторая мировая война (события 22 июня 1941 - 18 ноября 1942)",'file'=>"2",'legend'=>"Main",'pictures_list'=>"1",'questionnaire'=>"2"},{'category_sign'=>"war",'name_ua'=>"Друга світова війна (події 19 листопада 1942 – 9 травня 1945 рр.)",'name_ru'=>"Вторая мировая война (события 19 ноября 1942 - 9 мая 1945)",'file'=>"3",'legend'=>"Main",'pictures_list'=>"1",'questionnaire'=>"3"},{'category_sign'=>"war",'name_ua'=>"Друга світова війна. Бойові дії на Тихому океані (1939 – 1942 рр.)",'name_ru'=>"Вторая мировая война. Боевые действия на Тихом океане (1939 - 1942 рр.)",'file'=>"4",'legend'=>"Main",'pictures_list'=>"1",'questionnaire'=>"4-5"},{'category_sign'=>"war",'name_ua'=>"Друга світова війна. Бойові дії на Тихому океані (1943 – 1945 рр.)",'name_ru'=>"Вторая мировая война. Боевые действия на Тихом океане (1943 - 1945 рр.)",'file'=>"5",'legend'=>"Main",'pictures_list'=>"1",'questionnaire'=>"4-5"},{'category_sign'=>"war",'name_ua'=>"Світ у 1950 р.",'name_ru'=>"Мир в 1950",'file'=>"19",'legend'=>"Main",'pictures_list'=>"1",'questionnaire'=>"19-20"},{'category_sign'=>"west",'name_ua'=>"Європа після Другої світової війни. Територіальні зміни і політичний розвиток (1945 – 1956 рр.)",'name_ru'=>"Европа после Второй мировой войны. Территориальные изменения и политическое развитие (1945 - 1956 рр.)",'file'=>"6",'legend'=>"Main",'pictures_list'=>"2",'questionnaire'=>"6"},{'category_sign'=>"west",'name_ua'=>"Країни Америки",'name_ru'=>"Страны Америки",'file'=>"7",'legend'=>"Main",'pictures_list'=>"2",'questionnaire'=>"7"},{'category_sign'=>"west",'name_ua'=>"Країни Близького і Середнього Сходу",'name_ru'=>"Страны Ближнего и Среднего Востока",'file'=>"8",'legend'=>"Main",'pictures_list'=>"2",'questionnaire'=>"8"},{'category_sign'=>"ussr",'name_ua'=>"Радянський Союз у 1945 – 1953 рр.",'name_ru'=>"Советский Союз в 1945 - 1953 рр.",'file'=>"11",'legend'=>"Main",'pictures_list'=>"3",'questionnaire'=>"11-12"},{'category_sign'=>"ussr",'name_ua'=>"Радянський Союз у 1954 – 1985 рр.",'name_ru'=>"Советский Союз в 1954 - 1985 рр.",'file'=>"12",'legend'=>"Main",'pictures_list'=>"3",'questionnaire'=>"11-12"},{'category_sign'=>"ussr",'name_ua'=>"Розпад Радянського Союзу. Утворення нових держав",'name_ru'=>"Распад Советского Союза. Образование новых государств",'file'=>"13",'legend'=>"Main",'pictures_list'=>"3",'questionnaire'=>"13"},{'category_sign'=>"ussr",'name_ua'=>"Країни Кавказу наприкінці ХХ ст.",'name_ru'=>"Страны Кавказа в конце ХХ в.",'file'=>"14",'legend'=>"Main",'pictures_list'=>"3",'questionnaire'=>"14"},{'category_sign'=>"ussr",'name_ua'=>"Країни Центральної та Східної Європи в 1989 – 2008 рр.",'name_ru'=>"Страны Центральной и Восточной Европы в 1989 - 2008 рр.",'file'=>"15",'legend'=>"Main",'pictures_list'=>"3",'questionnaire'=>"15"},{'category_sign'=>"asia",'name_ua'=>"Китай, Японія і Корея",'name_ru'=>"Китай, Япония и Корея",'file'=>"16",'legend'=>"Main",'pictures_list'=>"4",'questionnaire'=>"16"},{'category_sign'=>"asia",'name_ua'=>"Країни Південної та Південно-Східної Азії",'name_ru'=>"Страны Южной и Юго-Восточной Азии",'file'=>"17",'legend'=>"Main",'pictures_list'=>"4",'questionnaire'=>"17"},{'category_sign'=>"asia",'name_ua'=>"Країни Африки",'name_ru'=>"Страны Африки",'file'=>"18",'legend'=>"Main",'pictures_list'=>"4",'questionnaire'=>"18"},{'category_sign'=>"afterwar",'name_ua'=>"Світ у 1945 – 1989 рр.",'name_ru'=>"Мир в 1945 - 1989 рр.",'file'=>"10",'legend'=>"Main",'questionnaire'=>"10"},{'category_sign'=>"afterwar",'name_ua'=>"Європа в 1945 – 1989 рр.",'name_ru'=>"Европа в 1945 - 1989 рр.",'file'=>"9",'legend'=>"Main",'questionnaire'=>"9"},{'category_sign'=>"afterwar",'name_ua'=>"Світ у 2008 р.",'name_ru'=>"Мир в 2008 году",'file'=>"20",'legend'=>"Main",'questionnaire'=>"19-20"}].each{|map| Map.create(map) }
    end
    if Bill.find(:all).size == 0
      code = (0...6).map{(65 + rand(26)).chr }.join
      token =  (0...32).map.with_index{|i| ('a'..'z').to_a.concat(('0'..'9').to_a)[rand(36)] }.join
      Bill.create({'code' => code, 'token' => token, 'paid' => 0})
    end
    if Control.find(:all).size == 0
      # PLACEHOLDER: default_lang, e.g. default_lang = 'ru'
      default_lang = 'ua'
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
