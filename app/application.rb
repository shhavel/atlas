require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  def initialize
    if Category.find(:all).size == 0 || Map.find(:all).size == 0
      Rhom::Rhom.database_full_reset(false, true)
      # PLACEHOLDER: categories & maps, i.e. categories.each{|category| Category.create(category) }
      [{'sign'=>"global",'name_ua'=>"Історія України 9 клас",'name_ru'=>"История Украины 9 класс"}].each{|category| Category.create(category) }
      [{'category_sign'=>"global",'name_ua'=>"Українські землі наприкінці XVIII ст.",'name_ru'=>"Украинские земли в конце XVIII в.",'file'=>"9_3",'summary'=>"9_3",'questionnaire'=>"9_3"},{'category_sign'=>"global",'name_ua'=>"Українські землі у складі Австрійської та Російської імперій на початку XIX ст.",'name_ru'=>"Украинские земли в составе Австрийской и Российской империй в начале XIX в.",'file'=>"9_5",'summary'=>"9_5_11",'pictures_list'=>"9_2",'questionnaire'=>"9_5_11"},{'category_sign'=>"global",'name_ua'=>"Українські землі в системі міжнародних відносин першої половини ХІХ ст. (1806 – 1812 рр.)",'name_ru'=>"Украинские земли в системе международных отношений первой половины XIX в. (1806 - 1812 рр.)",'file'=>"9_2",'summary'=>"9_6",'pictures_list'=>"9_3",'questionnaire'=>"9_6_7"},{'category_sign'=>"global",'name_ua'=>"Українські землі в системі міжнародних відносин першої половини ХІХ ст. (1812 – 1830 рр.)",'name_ru'=>"Украинские земли в системе международных отношений первой половины XIX в. (1812 - 1830 рр.)",'file'=>"9_7",'summary'=>"9_7",'pictures_list'=>"9_4",'questionnaire'=>"9_6_7"},{'category_sign'=>"global",'name_ua'=>"Суспільно-політичне життя на українських землях у першій половині ХІХ ст.",'name_ru'=>"Общественно-политическая жизнь на украинских землях в первой половине XIX в.",'file'=>"9_8",'summary'=>"9_8",'pictures_list'=>"9_5",'questionnaire'=>"9_8"},{'category_sign'=>"global",'name_ua'=>"Революційні події 40-х рр. ХІХ ст. на західноукраїнських землях",'name_ru'=>"Революционные события 40-х гг. на западноукраинских землях",'file'=>"9_6",'summary'=>"9_19"},{'category_sign'=>"global",'name_ua'=>"Господарство українських земель у першій половині ХІХ ст.",'name_ru'=>"Хозяйство украинских земель в первой половине XIX в.",'file'=>"9_9",'summary'=>"9_9",'questionnaire'=>"9_9"},{'category_sign'=>"global",'name_ua'=>"Українська культура першої половини ХІХ ст.",'name_ru'=>"Украинская культура первой половины XIX в.",'file'=>"9_10",'summary'=>"9_10",'pictures_list'=>"9_8",'questionnaire'=>"9_10"},{'category_sign'=>"global",'name_ua'=>"Адміністративно-територіальний поділ у 50-их роках ХІХ ст.",'name_ru'=>"Административно-территориальное деление в 50-х годах XIX в.",'file'=>"9_11",'summary'=>"9_11",'questionnaire'=>"9_11"},{'category_sign'=>"global",'name_ua'=>"Україна в Кримській війні 1853 – 1856 рр. Селянський рух 1855 – 1860 рр.",'name_ru'=>"Украина в Крымской войне 1853 - 1856 гг Крестьянское движение 1855 - 1860 рр.",'file'=>"9_12",'summary'=>"9_12",'pictures_list'=>"9_1",'questionnaire'=>"9_12"},{'category_sign'=>"global",'name_ua'=>"Скасування кріпосного права в українських землях",'name_ru'=>"Отмена крепостного права в украинских землях",'file'=>"9_13",'summary'=>"9_13",'pictures_list'=>"9_11",'questionnaire'=>"9_13"},{'category_sign'=>"global",'name_ua'=>"Економічний розвиток українських земель у другій половині ХІХ ст.",'name_ru'=>"Экономическое развитие украинских земель во второй половине XIX в.",'file'=>"9_14",'summary'=>"9_14",'pictures_list'=>"9_12",'questionnaire'=>"9_14"},{'category_sign'=>"global",'name_ua'=>"Суспільно-політичне життя на українських землях у другій половині ХІХ ст.",'name_ru'=>"Общественно-политическая жизнь на украинских землях во второй половине XIX в.",'file'=>"9_15",'summary'=>"9_15",'pictures_list'=>"9_13",'questionnaire'=>"9_15"},{'category_sign'=>"global",'name_ua'=>"Розселення та еміграція українців у другій половині ХІХ ст. – на початку ХХ ст.",'name_ru'=>"Расселение и эмиграция украинского во второй половине XIX в. - В начале ХХ ст.",'file'=>"9_16",'summary'=>"9_16",'pictures_list'=>"9_14",'questionnaire'=>"9_16"},{'category_sign'=>"global",'name_ua'=>"Демографічний стан українських земель наприкінціі ХІХ ст.",'name_ru'=>"Демографическое положение украинских земель наприкинции XIX в.",'file'=>"9_17",'summary'=>"9_17",'questionnaire'=>"9_17"},{'category_sign'=>"global",'name_ua'=>"Розвиток української культури у другій половині ХІХ ст.",'name_ru'=>"Развитие украинской культуры во второй половине XIX в.",'file'=>"9_18",'summary'=>"9_18",'pictures_list'=>"9_16",'questionnaire'=>"9_18"}].each{|map| Map.create(map) }
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
