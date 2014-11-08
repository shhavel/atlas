require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  def initialize
    if Category.find(:all).size == 0 || Map.find(:all).size == 0
      Rhom::Rhom.database_full_reset(false, true)
      # PLACEHOLDER: categories & maps, i.e. categories.each{|category| Category.create(category) }
      [{'sign'=>"global",'name_ua'=>"Історія України 8 клас",'name_ru'=>"История Украины 8 класс"}].each{|category| Category.create(category) }
      [{'category_sign'=>"global",'name_ua'=>"Українські землі наприкінці XV - у першій половині XVI ст.",'name_ru'=>"Украинские земли в конце XV - первой половине XVI в.",'file'=>"8_01",'summary'=>"8_01",'legend'=>"8_Main",'pictures_list'=>"8_01",'questionnaire'=>"8_01"},{'category_sign'=>"global",'name_ua'=>"Українські землі у другій половині XVI - у першій половині XVII ст.",'name_ru'=>"Украинские земли во второй половине XVI - первой половине XVII в.",'file'=>"8_02",'summary'=>"8_01",'legend'=>"8_Main",'pictures_list'=>"8_01",'questionnaire'=>"8_01"},{'category_sign'=>"global",'name_ua'=>"Виникнення українського козацтва та Запорозької Січі",'name_ru'=>"Возникновение украинского казачества и Запорожской Сечи",'file'=>"8_04",'summary'=>"8_02",'legend'=>"8_Main",'pictures_list'=>"8_02",'questionnaire'=>"8_02"},{'category_sign'=>"global",'name_ua'=>"Повстання 90-х років XVI ст.",'name_ru'=>"Восстание 90-х годов XVI в.",'file'=>"8_05",'summary'=>"8_03",'legend'=>"8_Main",'pictures_list'=>"8_03",'questionnaire'=>"8_03"},{'category_sign'=>"global",'name_ua'=>"Гетьман Конашевич-Сагайдачний. Українське козацтво у першій чверті XVII ст.",'name_ru'=>"Гетман Конашевич-Сагайдачный. Украинское казачество в первой четверти XVII в.",'file'=>"8_04",'summary'=>"8_04",'legend'=>"8_Main",'pictures_list'=>"8_04",'questionnaire'=>"8_04"},{'category_sign'=>"global",'name_ua'=>"Національно-визвольні повстання українського народу 20-30 рр. XVII ст.",'name_ru'=>"Национально-освободительные восстания украинского народа 20-30 гг XVII в.",'file'=>"8_05",'summary'=>"8_05",'legend'=>"8_Main",'pictures_list'=>"8_05",'questionnaire'=>"8_05"},{'category_sign'=>"global",'name_ua'=>"Церковне життя в другій половині XVI ст. Берестейська церковна унія",'name_ru'=>"Церковная жизнь во второй половине XVI в. Брестская церковная уния",'file'=>"8_03",'summary'=>"8_06",'legend'=>"8_Main",'pictures_list'=>"8_06",'questionnaire'=>"8_06"},{'category_sign'=>"global",'name_ua'=>"Церковне життя в першій половині XVII ст.",'name_ru'=>"Церковная жизнь в первой половине XVII в.",'file'=>"8_03",'summary'=>"8_07",'legend'=>"8_Main",'pictures_list'=>"8_07",'questionnaire'=>"8_07"},{'category_sign'=>"global",'name_ua'=>"Культура України в другій половині XVI - першій половині XVII ст. Розвиток освіти та науки",'name_ru'=>"Культура Украины во второй половине XVI - первой половине XVII в. Развитие образования и науки",'file'=>"8_06",'summary'=>"8_08",'legend'=>"8_Main",'pictures_list'=>"8_08",'questionnaire'=>"8_08"},{'category_sign'=>"global",'name_ua'=>"Розвиток літератури, музики, архітектури, образотворчого мистецтва в Україні у другій половині XVI - першій половині XVII ст.",'name_ru'=>"Развитие литературы, музыки, архитектуры, изобразительного искусства в Украине во второй половине XVI - первой половине XVII в.",'file'=>"8_06",'summary'=>"8_09",'legend'=>"8_Main",'pictures_list'=>"8_09",'questionnaire'=>"8_09"},{'category_sign'=>"global",'name_ua'=>"Передумови й початок Національно-визвольної війни українського народу проти польського панування",'name_ru'=>"Предпосылки и начало Национально-освободительной войны украинского народа против польского господства",'file'=>"8_07",'summary'=>"8_10",'legend'=>"8_Main",'pictures_list'=>"8_10",'questionnaire'=>"8_10"},{'category_sign'=>"global",'name_ua'=>"Розгортання Національно-визвольної війни в 1648 - 1649 рр.",'name_ru'=>"Развертывание Национально-освободительной войны в 1648 - 1649 рр.",'file'=>"8_07",'summary'=>"8_11",'legend'=>"8_Main",'pictures_list'=>"8_11",'questionnaire'=>"8_10"},{'category_sign'=>"global",'name_ua'=>"Утворення української козацької держави - Гетьманщини",'name_ru'=>"Образование украинского казацкого государства - Гетманщины",'file'=>"8_07",'summary'=>"8_12",'legend'=>"8_Main",'pictures_list'=>"8_12",'questionnaire'=>"8_12"},{'category_sign'=>"global",'name_ua'=>"Воєнно-політичні події Національно-визвольної війни 1650 - 1653 рр.",'name_ru'=>"Военно-политические события Национально-освободительной войны 1650 - 1653 рр.",'file'=>"8_08",'summary'=>"8_13",'legend'=>"8_Main",'pictures_list'=>"8_13",'questionnaire'=>"8_13"},{'category_sign'=>"global",'name_ua'=>"Українсько-московський договір 1654 р.",'name_ru'=>"Украинский-московский договор 1654 г.",'file'=>"8_08",'summary'=>"8_14",'legend'=>"8_Main",'pictures_list'=>"8_14",'questionnaire'=>"8_14"},{'category_sign'=>"global",'name_ua'=>"Україна в роки правління гетьмана Івана Виговського",'name_ru'=>"Украина в годы правления гетмана Ивана Выговского",'file'=>"8_09",'summary'=>"8_15",'legend'=>"8_Main",'pictures_list'=>"8_15",'questionnaire'=>"8_15"},{'category_sign'=>"global",'name_ua'=>"Порушення територіальної цілісності Української держави - Гетьманщини",'name_ru'=>"Нарушение территориальной целостности Украинского государства - Гетманщины",'file'=>"8_10",'summary'=>"8_16",'legend'=>"8_Main",'pictures_list'=>"8_16",'questionnaire'=>"8_16"},{'category_sign'=>"global",'name_ua'=>"Правобережна та Лівобережна Україна в 60 - 80 рр. XVII ст.",'name_ru'=>"Правобережная и Левобережная Украина в 60 - 80 гг XVII в.",'file'=>"8_11",'summary'=>"8_17",'legend'=>"8_Main",'pictures_list'=>"8_17",'questionnaire'=>"8_17"},{'category_sign'=>"global",'name_ua'=>"Україна у 1667 - 1687 рр.",'name_ru'=>"Украина в 1667 - 1687 рр.",'file'=>"8_11",'summary'=>"8_19",'legend'=>"8_Main",'pictures_list'=>"8_19",'questionnaire'=>"8_19"},{'category_sign'=>"global",'name_ua'=>"Україна наприкінці XVII - на початку XVIII ст. ",'name_ru'=>"Украина в конце XVII - начале XVIII в.",'file'=>"8_12",'summary'=>"8_19",'legend'=>"8_Main",'pictures_list'=>"8_19",'questionnaire'=>"8_19"},{'category_sign'=>"global",'name_ua'=>"Господарське життя й політичний устрій Лівобережної Гетьманщини та Слобідської України у другій половині XVII ст.",'name_ru'=>"Хозяйственная жизнь и политическое устройство Левобережной Гетманщины и Слободской Украины во второй половине XVII в.",'file'=>"8_11",'summary'=>"8_20",'legend'=>"8_Main",'pictures_list'=>"8_20",'questionnaire'=>"8_20"},{'category_sign'=>"global",'name_ua'=>"Гетьманщина та землі Правобережної України наприкінці XVII - на початку XVIII ст.",'name_ru'=>"Гетманщина и земли Правобережной Украины в конце XVII - начале XVIII в.",'file'=>"8_12",'summary'=>"8_21",'legend'=>"8_Main",'pictures_list'=>"8_21",'questionnaire'=>"8_21"},{'category_sign'=>"global",'name_ua'=>"Україна в подіях Північної війни. Повстання гетьмана Івана Мазепи проти Московії",'name_ru'=>"Украина в событиях Северной войны. Восстание гетмана Ивана Мазепы против Московии",'file'=>"8_12",'summary'=>"8_22",'legend'=>"8_Main",'pictures_list'=>"8_22",'questionnaire'=>"8_22"},{'category_sign'=>"global",'name_ua'=>"Гетьман Пилип Орлик та його Конституція України",'name_ru'=>"Гетман Пилип Орлик и его Конституция Украины",'file'=>"8_12",'summary'=>"8_23",'legend'=>"8_Main",'pictures_list'=>"8_23",'questionnaire'=>"8_23"},{'category_sign'=>"global",'name_ua'=>"Україна наприкінці XVII - на початку XVIII ст.",'name_ru'=>"Украина в конце XVII - начале XVIII в.",'file'=>"8_12",'summary'=>"8_24",'legend'=>"8_Main",'pictures_list'=>"8_24",'questionnaire'=>"8_24"},{'category_sign'=>"global",'name_ua'=>"Україна у 1727 - 1768 рр.",'name_ru'=>"Украина в 1727 - 1768 рр.",'file'=>"8_13",'summary'=>"8_24",'legend'=>"8_Main",'pictures_list'=>"8_24",'questionnaire'=>"8_24"},{'category_sign'=>"global",'name_ua'=>"Розвиток культури України в другій половині XVII - в першій половині XVIII ст.",'name_ru'=>"Развитие культуры Украины в второй половине XVII - первой половине XVIII в.",'file'=>"8_16",'summary'=>"8_26",'legend'=>"8_Main",'pictures_list'=>"8_26",'questionnaire'=>"8_26"}].each{|map| Map.create(map) }
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
