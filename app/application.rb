require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  def initialize
    if Category.find(:all).size == 0 || Map.find(:all).size == 0
      Rhom::Rhom.database_full_reset(false, true)
      # PLACEHOLDER: categories & maps, i.e. categories.each{|category| Category.create(category) }
      [{'sign'=>"global",'name_ua'=>"Природознавство",'name_ru'=>"Природоведение"}].each{|category| Category.create(category) }
      [{'category_sign'=>"global",'name_ua'=>"Поняття про план. Поняття про масштаб",'name_ru'=>"Понятие о плане. Понятие о масштабе",'file'=>"1",'summary'=>"1",'pictures_list'=>"1",'questionnaire'=>"1"},{'category_sign'=>"global",'name_ua'=>"Вода в природі",'name_ru'=>"Вода в природе",'file'=>"2_1",'summary'=>"2",'pictures_list'=>"2",'questionnaire'=>"2"},{'category_sign'=>"global",'name_ua'=>"Світовий океан",'name_ru'=>"Мировой океан",'file'=>"2_2",'summary'=>"2",'pictures_list'=>"2",'questionnaire'=>"2"},{'category_sign'=>"global",'name_ua'=>"Фізична карта півкуль",'name_ru'=>"Физическая карта полушарий",'file'=>"3",'summary'=>"3",'legend'=>"3",'pictures_list'=>"3",'questionnaire'=>"3"},{'category_sign'=>"global",'name_ua'=>"Державні символи",'name_ru'=>"Государственные символы",'file'=>"4_1",'summary'=>"4",'pictures_list'=>"4",'questionnaire'=>"4"},{'category_sign'=>"global",'name_ua'=>"Адміністративна карта",'name_ru'=>"Административная карта",'file'=>"4_2",'summary'=>"4",'legend'=>"4",'pictures_list'=>"4",'questionnaire'=>"4"},{'category_sign'=>"global",'name_ua'=>"Ґрунти",'name_ru'=>"Почвы",'file'=>"5",'summary'=>"5",'legend'=>"5",'questionnaire'=>"5"},{'category_sign'=>"global",'name_ua'=>"Фізична карта. Корисні копалини",'name_ru'=>"Физическая карта. Полезные ископаемые",'file'=>"6-7",'summary'=>"6-7",'legend'=>"6-7",'pictures_list'=>"5-6-7",'questionnaire'=>"6-7"},{'category_sign'=>"global",'name_ua'=>"Природні зони України. Рослинний і тваринний світ",'name_ru'=>"Природные зоны Украины. Растительный и животный мир",'file'=>"8-9",'summary'=>"8-9",'legend'=>"8-9",'pictures_list'=>"8-9",'questionnaire'=>"8-9"},{'category_sign'=>"global",'name_ua'=>"Господарство",'name_ru'=>"Хозяйство",'file'=>"10",'summary'=>"10",'legend'=>"10",'pictures_list'=>"10",'questionnaire'=>"10"},{'category_sign'=>"global",'name_ua'=>"Населення",'name_ru'=>"Населения",'file'=>"11_1",'summary'=>"11",'pictures_list'=>"11",'questionnaire'=>"11"},{'category_sign'=>"global",'name_ua'=>"Раси",'name_ru'=>"Расы",'file'=>"11_2",'summary'=>"11",'legend'=>"11",'pictures_list'=>"11",'questionnaire'=>"11"},{'category_sign'=>"global",'name_ua'=>"Північна Америка",'name_ru'=>"Северная Америка",'file'=>"12",'summary'=>"12",'legend'=>"12-17",'pictures_list'=>"12",'questionnaire'=>"12"},{'category_sign'=>"global",'name_ua'=>"Південна Америка",'name_ru'=>"Южная Америка",'file'=>"13",'summary'=>"13",'legend'=>"12-17",'pictures_list'=>"13",'questionnaire'=>"13"},{'category_sign'=>"global",'name_ua'=>"Африка",'name_ru'=>"Африка",'file'=>"14",'summary'=>"14",'legend'=>"12-17",'pictures_list'=>"14",'questionnaire'=>"14"},{'category_sign'=>"global",'name_ua'=>"Євразія",'name_ru'=>"Евразия",'file'=>"15",'summary'=>"15",'legend'=>"12-17",'pictures_list'=>"15",'questionnaire'=>"15"},{'category_sign'=>"global",'name_ua'=>"Австралія",'name_ru'=>"Австралия",'file'=>"16",'summary'=>"16",'legend'=>"12-17",'pictures_list'=>"16",'questionnaire'=>"16"},{'category_sign'=>"global",'name_ua'=>"Антарктида",'name_ru'=>"Антарктида",'file'=>"17",'summary'=>"17",'legend'=>"12-17",'pictures_list'=>"17",'questionnaire'=>"17"},{'category_sign'=>"global",'name_ua'=>"Зоряне небо Північної півкулі",'name_ru'=>"Звездное небо Северного полушария",'file'=>"18_1",'summary'=>"18",'pictures_list'=>"18",'questionnaire'=>"18"},{'category_sign'=>"global",'name_ua'=>"Сонячна система",'name_ru'=>"Солнечная система",'file'=>"18_2",'summary'=>"18",'pictures_list'=>"18",'questionnaire'=>"18"},{'category_sign'=>"global",'name_ua'=>"Земля – планета Сонячної системи. Глобус – модель Землі. Річний і добовий рухи землі",'name_ru'=>"Земля - ​​планета Солнечной системы. Глобус - модель Земли. Годовой и суточный движения земли",'file'=>"18_3",'summary'=>"18",'pictures_list'=>"18",'questionnaire'=>"18"},{'category_sign'=>"global",'name_ua'=>"Будова землі",'name_ru'=>"Строение земли",'file'=>"18_4",'summary'=>"18_4",'pictures_list'=>"18",'questionnaire'=>"18_4"},{'category_sign'=>"global",'name_ua'=>"Горизонт. Положення Сонця на небосхилі в різні пори року",'name_ru'=>"Горизонт. Положение Солнца на небосклоне в разные времена года",'file'=>"19",'summary'=>"19",'questionnaire'=>"19"},{'category_sign'=>"global",'name_ua'=>"Поняття сторін горизонту. Орієнтування на місцевості",'name_ru'=>"Понятие сторон горизонта. Ориентирование на местности",'file'=>"20",'summary'=>"20",'questionnaire'=>"20"},{'category_sign'=>"global",'name_ua'=>"Пізнання всесвіту ",'name_ru'=>"Познание вселенной",'file'=>"21",'summary'=>"21",'pictures_list'=>"21",'questionnaire'=>"21"}].each{|map| Map.create(map) }
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
