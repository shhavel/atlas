require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  def initialize
    if Category.find(:all).size == 0 || Map.find(:all).size == 0
      Rhom::Rhom.database_full_reset(false, true)
      # PLACEHOLDER: categories & maps, i.e. categories.each{|category| Category.create(category) }
      [{'sign'=>"global",'name_ua'=>"Історія України 11 клас",'name_ru'=>"История Украины 11 класс"}].each{|category| Category.create(category) }
      [{'category_sign'=>"global",'name_ua'=>"Україна напередодні Другої світової війни",'name_ru'=>"Украина накануне Второй мировой войны",'file'=>"11_1",'summary'=>"11_1",'legend'=>"11_Main"},{'category_sign'=>"global",'name_ua'=>"Україна на початку Другої світової війни (1 вересня 1939 р. – 22 червня 1941 р.)",'name_ru'=>"Украина в начале Второй мировой войны (1 сентября 1939 - 22 июня 1941)",'file'=>"11_2",'summary'=>"11_1_1",'legend'=>"11_Main",'questionnaire'=>"11_11"},{'category_sign'=>"global",'name_ua'=>"Україна у Великій Вітчизняній війні (червень 1941 р. – листопад 1942 р.)",'name_ru'=>"Украина в Великой Отечественной войне (июнь 1941 - ноябрь 1942 г.)",'file'=>"11_3",'summary'=>"11_3",'legend'=>"11_Main",'pictures_list'=>"11_3",'questionnaire'=>"11_01"},{'category_sign'=>"global",'name_ua'=>"Окупаційний режим в Україні",'name_ru'=>"Оккупационный режим в Украине",'file'=>"11_4",'summary'=>"11_4",'legend'=>"11_Main",'questionnaire'=>"11_02"},{'category_sign'=>"global",'name_ua'=>"Розгортання руху опору в Україні",'name_ru'=>"Развертывание движения сопротивления в Украине",'file'=>"11_5",'summary'=>"11_5",'legend'=>"11_Main",'pictures_list'=>"11_5",'questionnaire'=>"11_03"},{'category_sign'=>"global",'name_ua'=>"Україна у Великій Вітчизняній війні (листопад 1942 р. – січень 1945 р.)",'name_ru'=>"Украина в Великой Отечественной войне (ноябрь 1942 - январь 1945 г.)",'file'=>"11_6",'summary'=>"11_6",'legend'=>"11_Main",'pictures_list'=>"11_6",'questionnaire'=>"11_09"},{'category_sign'=>"global",'name_ua'=>"Україна в період повоєнної відбудови (1944 – 1953 рр.)",'name_ru'=>"Украина в период послевоенного восстановления (1944 - 1953 рр.)",'file'=>"11_7",'summary'=>"11_7",'legend'=>"11_Main",'pictures_list'=>"11_7"},{'category_sign'=>"global",'name_ua'=>"Україна в умовах десталінізації (1953 – 1964 рр.)",'name_ru'=>"Украина в условиях десталинизации (1953 - 1964 рр.)",'file'=>"11_8",'summary'=>"11_8",'legend'=>"11_Main",'pictures_list'=>"11_8",'questionnaire'=>"11_06"},{'category_sign'=>"global",'name_ua'=>"Опозиційний рух 1950 – 1980-их років",'name_ru'=>"Оппозиционное движение 1950 - 1980-х годов",'file'=>"11_9",'summary'=>"11_9",'legend'=>"11_Main",'pictures_list'=>"11_20"},{'category_sign'=>"global",'name_ua'=>"Радянський Союз наприкінці 1980-их років",'name_ru'=>"Советский Союз в конце 1980-х годов",'file'=>"11_10_1",'summary'=>"11_10_1",'legend'=>"11_Main",'pictures_list'=>"11_10",'questionnaire'=>"11_05"},{'category_sign'=>"global",'name_ua'=>"Релігійне життя в Україні на початку ХХІ ст.",'name_ru'=>"Религиозная жизнь в Украине в начале XXI века.",'file'=>"11_10_2",'summary'=>"11_10_2",'legend'=>"11_Main",'pictures_list'=>"11_19",'questionnaire'=>"11_08"},{'category_sign'=>"global",'name_ua'=>"Україна в 1985 – 1991 роках. Боротьба за незалежність",'name_ru'=>"Украина в 1985 - 1991 годах. Борьба за независимость",'file'=>"11_11",'summary'=>"11_11",'legend'=>"11_Main",'pictures_list'=>"11_11",'questionnaire'=>"11_10"},{'category_sign'=>"global",'name_ua'=>"Етнічний склад населення",'name_ru'=>"Этнический состав населения",'file'=>"11_12",'summary'=>"11_17",'legend'=>"11_Main",'pictures_list'=>"11_17",'questionnaire'=>"11_07"},{'category_sign'=>"global",'name_ua'=>"Зовнішня політика України. Українська діаспора",'name_ru'=>"Внешняя политика Украины. Украинская диаспора",'file'=>"11_13",'summary'=>"11_13",'legend'=>"11_Main",'pictures_list'=>"11_18",'questionnaire'=>"11_13"},{'category_sign'=>"global",'name_ua'=>"Україна сучасна",'name_ru'=>"Украина современная",'file'=>"11_14-15",'legend'=>"11_Main"},{'category_sign'=>"global",'name_ua'=>"Вибори в Україні 1991 – 2004 рр.",'name_ru'=>"Выборы в Украине 1991 - 2004 рр.",'file'=>"11_16",'summary'=>"11_16",'legend'=>"11_Main",'questionnaire'=>"11_04"},{'category_sign'=>"global",'name_ua'=>"Вибори в Україні 2004 – 2007 рр.",'name_ru'=>"Выборы в Украине 2004 - 2007 рр.",'file'=>"11_17",'legend'=>"11_Main",'questionnaire'=>"11_04"}].each{|map| Map.create(map) }
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
