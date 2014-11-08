require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  def initialize
    if Category.find(:all).size == 0 || Map.find(:all).size == 0
      Rhom::Rhom.database_full_reset(false, true)
      # PLACEHOLDER: categories & maps, i.e. categories.each{|category| Category.create(category) }
      [{'sign'=>"global",'name_ua'=>"Історія України 10 клас",'name_ru'=>"История Украины 10 класс"}].each{|category| Category.create(category) }
      [{'category_sign'=>"global",'name_ua'=>"АДМІНІСТРАТИВНО-ТЕРИТОРІАЛЬНИЙ ПОДІЛ УКРАЇНСЬКИХ ЗЕМЕЛЬ НАПЕРЕДОДНІ ПЕРШОЇ СВІТОВОЇ ВІЙНИ. ТЕРИТОРІАЛЬНІ ЗАЗІХАННЯ ВОРОГУЮЧИХ СТОРІН НАПЕРЕДОДНІ ВІЙНИ і УКРАЇНА",'name_ru'=>"АДМИНИСТРАТИВНО-ТЕРРИТОРИАЛЬНОЕ ДЕЛЕНИЕ УКРАИНСКИХ ЗЕМЕЛЬ НАКАНУНЕ ПЕРВОЙ МИРОВОЙ ВОЙНЫ. ТЕРРИТОРИАЛЬНЫЕ ПОСЯГАТЕЛЬСТВО ВРАЖДУЮЩИХ СТОРОН НАКАНУНЕ ВОЙНЫ и УКРАИНА",'file'=>"1",'summary'=>"1",'pictures_list'=>"1",'questionnaire'=>"1"},{'category_sign'=>"global",'name_ua'=>"УКРАЇНСЬКІ ПОЛІТИЧНІ ПАРТІЇ, ГРОМАДСЬКІ ОРГАНІЗАЦІЇ і ЗБРОЙНІ ФОРМУВАННЯ в РОКИ ПЕРШОЇ СВІТОВОЇ ВІЙНИ. БОЙОВИЙ ШЛЯХ ЛЕГІОНУ УКРАЇНСЬКИХ СІЧОВИХ СТРІЛЬЦІВ (1914–1917 рр.)",'name_ru'=>"УКРАИНСКИЕ ПОЛИТИЧЕСКИЕ ПАРТИИ, ОБЩЕСТВЕННЫЕ ОРГАНИЗАЦИИ и ВООРУЖЕННЫЕ ФОРМИРОВАНИЯ в ГОДЫ ПЕРВОЙ МИРОВОЙ ВОЙНЫ. БОЕВОЙ ПУТЬ легионе УКРАИНСКАЯ СЕЧЕВЫХ СТРЕЛКОВ (1914-1917 гг)",'file'=>"2",'summary'=>"2",'pictures_list'=>"2",'questionnaire'=>"2"},{'category_sign'=>"global",'name_ua'=>"УКРАЇНА в ПЕРШІЙ СВІТОВІЙ ВІЙНІ (1914–1917 рр.)",'name_ru'=>"УКРАИНА в ПЕРВОЙ МИРОВОЙ ВОЙНЕ (1914-1917 гг)",'file'=>"3",'summary'=>"3",'pictures_list'=>"3",'questionnaire'=>"3"},{'category_sign'=>"global",'name_ua'=>"ПОЧАТОК ВИЗВОЛЬНИХ ЗМАГАНЬ УКРАЇНСЬКОГО НАРОДУ. УТВОРЕННЯ УКРАЇНСЬКОЇ НАРОДНОЇ РЕСПУБЛІКИ (березень 1917 – березень 1918 рр.)",'name_ru'=>"НАЧАЛО ОСВОБОДИТЕЛЬНЫХ СОРЕВНОВАНИЙ УКРАИНСКАЯ НАРОДУ. УТВОРЕННЯ УКРАИНСКОЙ НАРОДНОЙ РЕСПУБЛИКИ (март 1917 - март 1918)",'file'=>"4",'summary'=>"4",'pictures_list'=>"4",'questionnaire'=>"4"},{'category_sign'=>"global",'name_ua'=>"ПЕРША ВІЙНА РАДЯНСЬКОЇ РОСІЇ з УКРАЇНСЬКОЮ НАРОДНОЮ РЕСПУБЛІКОЮ (грудень 1917 – травень 1918 рр.)",'name_ru'=>"ПЕРВАЯ ВОЙНА СОВЕТСКОЙ РОССИИ с УКРАИНСКОЙ НАРОДНОЙ РЕСПУБЛИКОЙ (декабрь 1917 - май 1918)",'file'=>"5",'summary'=>"5",'pictures_list'=>"5",'questionnaire'=>"5"},{'category_sign'=>"global",'name_ua'=>"УКРАЇНСЬКА ДЕРЖАВА. УТВОРЕННЯ ДИРЕКТОРІЇ та ВІДНОВЛЕННЯ УНР (травень – листопад 1918 р.)",'name_ru'=>"УКРАИНСКАЯ ДЕРЖАВА. ОБРАЗОВАНИЯ ДИРЕКТОРИЯ и ВОССТАНОВЛЕНИЕ УНР (май - ноябрь 1918 г.)",'file'=>"6",'summary'=>"6",'pictures_list'=>"6",'questionnaire'=>"6"},{'category_sign'=>"global",'name_ua'=>"ЗАХІДНОУКРАЇНСЬКІ ЗЕМЛІ у жовтні 1918 – серпні 1919 рр. ЧОРТКІВСЬКА НАСТУПАЛЬНА ОПЕРАЦІЯ (ОФЕНЗИВА) УКРАЇНСЬКОЇ ГАЛИЦЬКОЇ АРМІЇ. ЗАВЕРШЕННЯ ОКУПАЦІЇ ГАЛИЧИНИ ПОЛЬЩЕЮ (червень – липень 1919 р.)",'name_ru'=>"ЗАПАДНОУКРАИНСКИЕ ЗЕМЛИ в октябре 1918 - августе 1919 ЧЕРТКОВСКАЯ НАСТУПАТЕЛЬНАЯ ОПЕРАЦИЯ (офензива) УКРАИНСКОЙ Галицкой АРМИИ. ЗАВЕРШЕНИЕ ОККУПАЦИИ ГАЛИЧИНЫ ПОЛЬШЕЙ (июнь - июль 1919 г.)",'file'=>"7",'summary'=>"7",'pictures_list'=>"7"},{'category_sign'=>"global",'name_ua'=>"ДРУГА ВІЙНА РАДЯНСЬКОЇ РОСІЇ ПРОТИ УНР. ВСТАНОВЛЕННЯ в УКРАЇНІ БІЛЬШОВИЦЬКОГО РЕЖИМУ (грудень 1918 – червень 1919 рр.)",'name_ru'=>"ВТОРАЯ ВОЙНА СОВЕТСКОЙ РОССИИ ПРОТИВ УНР. УСТАНОВКА В УКРАИНЕ БОЛЬШЕВИСТСКОГО РЕЖИМА (декабрь 1918 - июнь 1919)",'file'=>"8",'summary'=>"8",'pictures_list'=>"8"},{'category_sign'=>"global",'name_ua'=>"НАСТУП БІЛОГВАРДІЙЦІВ в УКРАЇНІ. КОНТРНАСТУП ОБ'ЄДНАНИХ УКРАЇНСЬКИХ АРМІЙ та ЇХНЯ ПОРАЗКА (липень – жовтень 1919 р.). РОЗГРОМ АРМІЇ ДЕНІКІНА. ВІДНОВЛЕННЯ БІЛЬШОВИЦЬКОГО РЕЖИМУ в УКРАЇНІ (жовтень 1919 – квітень 1920 рр.)",'name_ru'=>"НАСТУПЛЕНИЕ БЕЛОГВАРДЕЙЦЕВ в УКРАИНЕ. КОНТРНАСТУПЛЕНИЕ ОБЪЕДИНЕННЫХ УКРАИНСКАЯ АРМИЯ и ИХ ПОРАЖЕНИЕ (июль - октябрь 1919 г.). РАЗГРОМ АРМИИ ДЕНИКИНА. ВОССТАНОВЛЕНИЕ БОЛЬШЕВИСТСКОГО РЕЖИМА в УКРАИНЕ (октябрь 1919 - апрель 1920)",'file'=>"9",'summary'=>"9",'pictures_list'=>"9"},{'category_sign'=>"global",'name_ua'=>"РАДЯНСЬКО-ПОЛЬСЬКА ВІЙНА і УКРАЇНА. РОЗГРОМ ВІЙСЬК ВРАНГЕЛЯ і ЗАГОНІВ МАХНА (квітень 1920 – листопад 1921 рр.)",'name_ru'=>"СОВЕТСКО-ПОЛЬСКАЯ ВОЙНА и УКРАИНА. РАЗГРОМ ВОЙСК ВРАНГЕЛЯ и ОТРЯДОВ МАХНО (Апрель 1920 - ноябрь 1921)",'file'=>"10",'summary'=>"10",'pictures_list'=>"10"},{'category_sign'=>"global",'name_ua'=>"КУЛЬТУРА і ДУХОВНЕ ЖИТТЯ в УКРАЇНІ 1917 – 1920 рр.",'name_ru'=>"КУЛЬТУРА и ДУХОВНАЯ ЖИЗНЬ В УКРАИНЕ 1917 - 1920 гг",'file'=>"11",'summary'=>"11",'pictures_list'=>"11"},{'category_sign'=>"global",'name_ua'=>"СТАН ЕКОНОМІКИ УКРАЇНИ в 1921–1928 рр. НОВА ЕКОНОМІЧНА ПОЛІТИКА в УСРР",'name_ru'=>"СОСТОЯНИЕ ЭКОНОМИКИ УКРАИНЫ в 1921-1928 гг НОВАЯ ЭКОНОМИЧЕСКАЯ ПОЛИТИКА в УССР",'file'=>"12",'summary'=>"12",'pictures_list'=>"12"},{'category_sign'=>"global",'name_ua'=>"ЦЕРКОВНО-РЕЛІГІЙНЕ ЖИТТЯ в УКРАЇНІ в 1921–1930 рр. УКРАЇНСЬКА ПОЛІТИЧНА ЕМІГРАЦІЯ в МІЖВОЄННИЙ ПЕРІОД",'name_ru'=>"ЦЕРКОВНО РЕЛИГИОЗНОЙ ЖИЗНИ В УКРАИНЕ в 1921-1930 гг УКРАИНСКАЯ ПОЛИТИЧЕСКАЯ ЭМИГРАЦИЯ в МЕЖВОЕННЫЙ ПЕРИОД",'file'=>"13",'summary'=>"13",'pictures_list'=>"13"},{'category_sign'=>"global",'name_ua'=>"РАДЯНСЬКА МОДЕРНІЗАЦІЯ УКРАЇНИ. СТАН ЕКОНОМІКИ в 1928–1939 рр.",'name_ru'=>"СОВЕТСКАЯ МОДЕРНИЗАЦИЯ УКРАИНЫ. СОСТОЯНИЕ ЭКОНОМИКИ в 1928-1939 гг",'file'=>"14",'summary'=>"14",'pictures_list'=>"14"},{'category_sign'=>"global",'name_ua'=>"КУЛЬТУРНЕ ЖИТТЯ УКРАЇНИ в 1921–1939 рр.",'name_ru'=>"КУЛЬТУРНАЯ ЖИЗНЬ УКРАИНЫ в 1921-1939 гг",'file'=>"15",'summary'=>"15",'pictures_list'=>"15"},{'category_sign'=>"global",'name_ua'=>"ЗАХІДНОУКРАЇНСЬКІ ЗЕМЛІ в 1920–1939 рр.",'name_ru'=>"ЗАПАДНОУКРАИНСКИЕ ЗЕМЛИ в 1920-1939 гг",'file'=>"16",'summary'=>"16",'pictures_list'=>"16"}].each{|map| Map.create(map) }
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
