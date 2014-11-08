require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  def initialize
    if Category.find(:all).size == 0 || Map.find(:all).size == 0
      Rhom::Rhom.database_full_reset(false, true)
      # PLACEHOLDER: categories & maps, i.e. categories.each{|category| Category.create(category) }
      [{'sign'=>"earth",'name_ua'=>"ГЕОГРАФІЧНЕ ПІЗНАННЯ ЗЕМЛІ",'name_en'=>"GEOGRAPHICAL KNOWLEDGE OF EARTH",'name_ru'=>"ГЕОГРАФИЧЕСКОЕ ПОЗНАНИЕ ЗЕМЛИ",},{'sign'=>"oldmaps",'name_ua'=>"СТАРОВИННІ КАРТИ",'name_en'=>"Ancient maps",'name_ru'=>"СТАРИННЫЕ КАРТЫ",},{'sign'=>"planmap",'name_ua'=>"ЗЕМЛЯ НА ПЛАНІ ТА КАРТІ",'name_en'=>"EARTH TO PLAN AND MAP",'name_ru'=>"ЗЕМЛЯ НА ПЛАНЕ И КАРТЕ",},{'sign'=>"litosphere",'name_ua'=>"ЛІТОСФЕРА",'name_en'=>"Lithosphere",'name_ru'=>"ЛИТОСФЕРА",},{'sign'=>"hydrosphere",'name_ua'=>"ГІДРОСФЕРА",'name_en'=>"Hydrosphere",'name_ru'=>"ГИДРОСФЕРА",},{'sign'=>"atmosphere",'name_ua'=>"АТМОСФЕРА",'name_en'=>"ATMOSPHERE",'name_ru'=>"АТМОСФЕРА",},{'sign'=>"biosphere",'name_ua'=>"БІОСФЕРА ТА ГЕОГРАФІЧНА ОБОЛОНКА",'name_en'=>"BIOSPHERE AND GEOGRAPHIC SHELL",'name_ru'=>"БИОСФЕРА И ГЕОГРАФИЧЕСКАЯ ОБОЛОЧКА",},{'sign'=>"people",'name_ua'=>"ЗЕМЛЯ – ПЛАНЕТА ЛЮДЕЙ",'name_en'=>"EARTH - THE PLANET OF PEOPLE",'name_ru'=>"ЗЕМЛЯ - ПЛАНЕТА ЛЮДЕЙ",}].each{|category| Category.create(category) }
      [{'category_sign'=>"earth",'name_ua'=>"Уявлення людей про Землю",'name_en'=>"Ideas that people have about the Earth",'name_ru'=>"Представления людей о Земле",'file'=>"01",'summary'=>"01",'pictures_list'=>"01",'questionnaire'=>"01",},{'category_sign'=>"earth",'name_ua'=>"Географічні відкриття і подорожі (до середини XVII ст.)",'name_en'=>"The geographical discoveries and travel (to the middle of the XVII century.)",'name_ru'=>"Географические открытия и путешествия (до середины XVII в.)",'file'=>"02_03",'summary'=>"02_03",'pictures_list'=>"01",'legend'=>"02_03",'questionnaire'=>"01",},{'category_sign'=>"earth",'name_ua'=>"Географічні відкриття нового часу",'name_en'=>"The geographical discoveries of modern times",'name_ru'=>"Географические открытия нового времени",'file'=>"04_05",'summary'=>"04_05",'pictures_list'=>"01",'legend'=>"04_05",'questionnaire'=>"01",},{'category_sign'=>"oldmaps",'name_ua'=>"Карта світу Ідрісі, XII ст.",'name_en'=>"World Map Idrisi, XII century.",'name_ru'=>"Карта мира Идриси, XII в.",'file'=>"old_01",'questionnaire'=>"01",},{'category_sign'=>"oldmaps",'name_ua'=>"Карта Птолемея, опублікована в 1482 р.",'name_en'=>"Ptolemy's world map, published in 1482",'name_ru'=>"Карта Птолемея, опубликована в 1482",'file'=>"old_02",'questionnaire'=>"01",},{'category_sign'=>"oldmaps",'name_ua'=>"Карта Меркатора, XVI ст.",'name_en'=>"Map Mercator, XVI century.",'name_ru'=>"Карта Меркатора, XVI в.",'file'=>"old_03",'questionnaire'=>"01",},{'category_sign'=>"oldmaps",'name_ua'=>"Карта світу Н.Белліна, 1748 р.",'name_en'=>"World Map N.Bellina, 1748",'name_ru'=>"Карта мира Н.Беллина, 1748",'file'=>"old_04",'questionnaire'=>"01",},{'category_sign'=>"oldmaps",'name_ua'=>"Карта півкуль, Ф. Сантіні, 1780 р.",'name_en'=>"Map hemispheres, F. Santini, 1780",'name_ru'=>"Карта полушарий, Ф. Сантини, 1780",'file'=>"old_05",'questionnaire'=>"01",},{'category_sign'=>"oldmaps",'name_ua'=>"Карта півдня Росії, Чорного моря та Малої Татарії, Б. Гоманн, XVII ст.",'name_en'=>"Map of southern Russia, the Black Sea and Little Tartary, B. Homann, XVII century.",'name_ru'=>"Карта юга России, Черного моря и Малой Татарии, Б. Гоманн, XVII в.",'file'=>"old_06",'questionnaire'=>"01",},{'category_sign'=>"planmap",'name_ua'=>"Глобус - модель Землі",'name_en'=>"Globus - the view",'name_ru'=>"Глобус - модель Земли",'file'=>"06",'summary'=>"06",'pictures_list'=>"03",'questionnaire'=>"02",},{'category_sign'=>"planmap",'name_ua'=>"Окомірне знімання місцевості",'name_en'=>"Okomirne removal area",'name_ru'=>"Глазомерных съемки местности",'file'=>"07",'summary'=>"07",'pictures_list'=>"03",'questionnaire'=>"02",},{'category_sign'=>"planmap",'name_ua'=>"План місцевості. Масштаб 1:50 000",'name_en'=>"Plan area. Scale 1:50 000",'name_ru'=>"План местности. Масштаб 1:50 000",'file'=>"08",'summary'=>"08",'pictures_list'=>"03",'legend'=>"08_09",'questionnaire'=>"02",},{'category_sign'=>"planmap",'name_ua'=>"План місцевості. Масштаб 1:10 000 Умовні позначення",'name_en'=>"Plan area. Scale 1:10 000 Symbols",'name_ru'=>"План местности. Масштаб 1:10 000 Условные обозначения",'file'=>"09",'summary'=>"09",'pictures_list'=>"03",'legend'=>"08_09",'questionnaire'=>"02",},{'category_sign'=>"planmap",'name_ua'=>"Зображення суходолу та вод на карті",'name_en'=>"Images of land and water on the map",'name_ru'=>"Изображение суши и вод на карте",'file'=>"10",'summary'=>"10",'pictures_list'=>"03",'questionnaire'=>"02",},{'category_sign'=>"planmap",'name_ua'=>"Залежність зображення від масштабу карти. Найвищі гірські вершини",'name_en'=>"Dependence of the image of the map scale. The highest peaks",'name_ru'=>"Зависимость изображения от масштаба карты. Высокие горные вершины",'file'=>"11",'summary'=>"11",'pictures_list'=>"03",'questionnaire'=>"02",},{'category_sign'=>"litosphere",'name_ua'=>"Внутрішня будова Землі. Літосфера. Дрейф материків",'name_en'=>"The internal structure of the Earth. Lithosphere. Continental drift",'name_ru'=>"Внутреннее строение Земли. Литосфера. Дрейф материков",'file'=>"12",'summary'=>"12",'pictures_list'=>"04",'questionnaire'=>"03_1",},{'category_sign'=>"litosphere",'name_ua'=>"Будова земної кори",'name_en'=>"Structure of the crust",'name_ru'=>"Строение земной коры",'file'=>"13",'summary'=>"13",'pictures_list'=>"04",'legend'=>"13",'questionnaire'=>"03_1",},{'category_sign'=>"litosphere",'name_ua'=>"Фізична карта півкуль",'name_en'=>"Physical map of the hemispheres",'name_ru'=>"Физическая карта полушарий",'file'=>"14_15",'summary'=>"14_15",'pictures_list'=>"04",'legend'=>"14_15",'questionnaire'=>"03_1",},{'category_sign'=>"litosphere",'name_ua'=>"Фізична карта України",'name_en'=>"Physical map of Ukraine",'name_ru'=>"Физическая карта Украины",'file'=>"16_17",'summary'=>"16_17",'pictures_list'=>"04",'legend'=>"16_17",'questionnaire'=>"03_1",},{'category_sign'=>"hydrosphere",'name_ua'=>"Карта океанів",'name_en'=>"Map of oceans",'name_ru'=>"Карта океанов",'file'=>"18_19",'summary'=>"18_19",'pictures_list'=>"04",'legend'=>"18_19",'questionnaire'=>"03_2",},{'category_sign'=>"hydrosphere",'name_ua'=>"Гідросфера",'name_en'=>"Hydrosphere",'name_ru'=>"Гидросфера",'file'=>"20",'summary'=>"20",'pictures_list'=>"04",'questionnaire'=>"03_2",},{'category_sign'=>"atmosphere",'name_ua'=>"Будова атмосфери. Пояси сонячного освітлення",'name_en'=>"Structure of the atmosphere. Belts sunlight",'name_ru'=>"Строение атмосферы. Пояса солнечного освещения",'file'=>"21",'summary'=>"21",'pictures_list'=>"04",'questionnaire'=>"03_3",},{'category_sign'=>"atmosphere",'name_ua'=>"Кліматична карта",'name_en'=>"Climatic map",'name_ru'=>"Климатическая карта",'file'=>"22_23",'summary'=>"22_23",'pictures_list'=>"04",'legend'=>"22_23",'questionnaire'=>"03_3",},{'category_sign'=>"atmosphere",'name_ua'=>"Кліматичні пояси",'name_en'=>"Climatic zones",'name_ru'=>"Климатические пояса",'file'=>"22",'summary'=>"22",'pictures_list'=>"04",'legend'=>"22",'questionnaire'=>"03_3",},{'category_sign'=>"biosphere",'name_ua'=>"Природні комплекси",'name_en'=>"Natural complexes",'name_ru'=>"Природные комплексы",'file'=>"24_25",'summary'=>"24_25",'pictures_list'=>"04",'legend'=>"24_25",'questionnaire'=>"03_4",},{'category_sign'=>"biosphere",'name_ua'=>"Географічні пояси",'name_en'=>"Geographic zones",'name_ru'=>"Географические пояса",'file'=>"24",'summary'=>"24_25",'pictures_list'=>"04",'legend'=>"24",'questionnaire'=>"03_4",},{'category_sign'=>"biosphere",'name_ua'=>"Ґрунти",'name_en'=>"Soils",'name_ru'=>"Почвы",'file'=>"26",'summary'=>"26",'pictures_list'=>"04",'legend'=>"26",'questionnaire'=>"03_4",},{'category_sign'=>"biosphere",'name_ua'=>"Глобальні екологічні проблеми",'name_en'=>"Global environmental problems",'name_ru'=>"Глобальные экологические проблемы",'file'=>"27",'summary'=>"27",'pictures_list'=>"04",'legend'=>"27",'questionnaire'=>"03_4",},{'category_sign'=>"people",'name_ua'=>"Людські раси світу та найбільш чисельні народи. Розміщення населення",'name_en'=>"The human race in the world and the most numerous nations. Placement of the population",'name_ru'=>"Человеческие расы мира и наиболее многочисленные народы. Размещение населения",'file'=>"28_29",'summary'=>"28_29",'pictures_list'=>"05",'legend'=>"28_29",'questionnaire'=>"04",},{'category_sign'=>"people",'name_ua'=>"Політична карта світу",'name_en'=>"Political World Map",'name_ru'=>"Политическая карта мира",'file'=>"30_31",'summary'=>"30_31",'pictures_list'=>"05",'legend'=>"30_31",'questionnaire'=>"04",},{'category_sign'=>"people",'name_ua'=>"Адміністративно-територіальний поділ України",'name_en'=>"Administrative divisions of Ukraine",'name_ru'=>"Административно-территориальное деление Украины",'file'=>"32",'summary'=>"32",'pictures_list'=>"05",'legend'=>"32",'questionnaire'=>"04",}].each{|map| Map.create(map) }
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
