require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  def initialize
    if Category.find(:all).size == 0 || Map.find(:all).size == 0
      Rhom::Rhom.database_full_reset(false, true)
      # PLACEHOLDER: categories & maps, i.e. categories.each{|category| Category.create(category) }
      [{'sign'=>"global",'name_ua'=>"Історія України 5 клас",'name_en'=>"Ukraine History Grade 5",'name_ru'=>"История Украины 5 класс"}].each{|category| Category.create(category) }
      [{'category_sign'=>"global",'name_ua'=>"Знайомство з історичною картою",'name_en'=>"Introduction to historical maps",'name_ru'=>"Знакомство с исторической картой",'file'=>"1"},{'category_sign'=>"global",'name_ua'=>"Історико-етнографічні землі України",'name_en'=>"Historical and ethnographic land Ukraine",'name_ru'=>"Историко-этнографические земли Украины",'file'=>"2",'summary'=>"2",'pictures_list'=>"2"},{'category_sign'=>"global",'name_ua'=>"Східні слов'яни",'name_en'=>"Eastern Slavs",'name_ru'=>"Восточные славяне",'file'=>"3",'summary'=>"3",'pictures_list'=>"3"},{'category_sign'=>"global",'name_ua'=>"Становлення Київської Русі. Перші князі",'name_en'=>"The formation of Kievan Rus. The first princes",'name_ru'=>"Становление Киевской Руси. Первые князья",'file'=>"4",'summary'=>"4",'pictures_list'=>"4"},{'category_sign'=>"global",'name_ua'=>"Русь часів Володимира Великого та Ярослава Мудрого",'name_en'=>"Russ times Volodymyr the Great and Yaroslav the Wise",'name_ru'=>"Русь времен Владимира Великого и Ярослава Мудрого",'file'=>"5",'summary'=>"5",'pictures_list'=>"5"},{'category_sign'=>"global",'name_ua'=>"Стародавній Київ",'name_en'=>"Ancient Kyiv",'name_ru'=>"Древний Киев",'file'=>"6",'summary'=>"6",'pictures_list'=>"6"},{'category_sign'=>"global",'name_ua'=>"Русь за часів роздробленості",'name_en'=>"Russia during the disintegration",'name_ru'=>"Русь во времена раздробленности",'file'=>"7",'summary'=>"7",'pictures_list'=>"7"},{'category_sign'=>"global",'name_ua'=>"Монгольська навала",'name_en'=>"Mongol invasion",'name_ru'=>"Монгольское нашествие",'file'=>"8",'summary'=>"8",'pictures_list'=>"8"},{'category_sign'=>"global",'name_ua'=>"Галицько-Волинська держава",'name_en'=>"Galicia-Volyn state",'name_ru'=>"Галицко-Волынское государство",'file'=>"9",'summary'=>"9",'pictures_list'=>"9"},{'category_sign'=>"global",'name_ua'=>"Українські землі в ХІV – ХІV століттях",'name_en'=>"Ukrainian lands in XIV - XIV centuries",'name_ru'=>"Украинские земли в XIV - XIV веках",'file'=>"10",'summary'=>"10",'pictures_list'=>"10"},{'category_sign'=>"global",'name_ua'=>"Українські землі в ХVІ столітті",'name_en'=>"Ukrainian lands in the sixteenth century",'name_ru'=>"Украинские земли в XVI веке",'file'=>"11",'summary'=>"11",'pictures_list'=>"11"},{'category_sign'=>"global",'name_ua'=>"Виникнення українського козацтва. Запорозька Січ",'name_en'=>"The emergence of the Ukrainian Cossacks. ZaporizhzhyaJanuary",'name_ru'=>"Возникновение украинского казачества. Запорожская Сечь",'file'=>"12",'summary'=>"12",'pictures_list'=>"12"},{'category_sign'=>"global",'name_ua'=>"Національно-визвольна війна. Утворення української козацької держави",'name_en'=>"National War. The emergence of Ukrainian Cossack state",'name_ru'=>"Национально-освободительная война. Образование украинского казацкого государства",'file'=>"13",'summary'=>"13",'pictures_list'=>"13"},{'category_sign'=>"global",'name_ua'=>"Гетьманщина в другій половині ХVІІ – на початку ХVІІІ століття",'name_en'=>"Hetman in the second half of the seventeenth - early eighteenth century",'name_ru'=>"Гетманщина во второй половине ХVII - начале ХVIII века",'file'=>"14",'summary'=>"14",'pictures_list'=>"14"},{'category_sign'=>"global",'name_ua'=>"Україна у ХVІІІ столітті",'name_en'=>"Ukraine in the eighteenth century",'name_ru'=>"Украина в XVIII веке",'file'=>"15",'summary'=>"15",'pictures_list'=>"15"},{'category_sign'=>"global",'name_ua'=>"Україна у складі двої імперій",'name_en'=>"Ukraine as part dvoyi Empires",'name_ru'=>"Украина в составе двои империй",'file'=>"16",'summary'=>"16",'pictures_list'=>"16"},{'category_sign'=>"global",'name_ua'=>"Україна в ХІХ – на початку ХХ століття",'name_en'=>"Ukraine in the nineteenth - early twentieth century",'name_ru'=>"Украина в XIX - начале ХХ века",'file'=>"17",'summary'=>"17",'pictures_list'=>"17"},{'category_sign'=>"global",'name_ua'=>"Українська революція",'name_en'=>"Ukrainian Revolution",'name_ru'=>"Украинская революция",'file'=>"18",'summary'=>"18",'pictures_list'=>"18"},{'category_sign'=>"global",'name_ua'=>"Україна в міжвоєнний період",'name_en'=>"Ukraine in the interwar period",'name_ru'=>"Украина в межвоенный период",'file'=>"19",'summary'=>"19",'pictures_list'=>"19"},{'category_sign'=>"global",'name_ua'=>"Україна в Другій Світовій війні (1939 – 1942 рр.)",'name_en'=>"Ukraine in World War II (1939 - 1942 gg.)",'name_ru'=>"Украина во Второй Мировой войне (1939 - 1942 рр.)",'file'=>"20",'summary'=>"20",'pictures_list'=>"20"},{'category_sign'=>"global",'name_ua'=>"Україна в Другій Світовій війні (1943 – 1945 рр.)",'name_en'=>"Ukraine in World War II (1943 - 1945 gg.)",'name_ru'=>"Украина во Второй Мировой войне (1943 - 1945 рр.)",'file'=>"21",'summary'=>"21",'pictures_list'=>"21"},{'category_sign'=>"global",'name_ua'=>"Україна у складі СРСР",'name_en'=>"Ukraine in the USSR",'name_ru'=>"Украина в составе СССР",'file'=>"22",'summary'=>"22",'pictures_list'=>"22"},{'category_sign'=>"global",'name_ua'=>"Україна незалежна",'name_en'=>"Independent Ukraine",'name_ru'=>"Украина независимая",'file'=>"23",'summary'=>"23",'pictures_list'=>"23"}].each{|map| Map.create(map) }
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
