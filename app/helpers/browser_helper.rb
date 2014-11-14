# encoding: utf-8
module BrowserHelper

  def placeholder(label=nil)
    "placeholder='#{label}'" if platform == 'apple'
  end

  def platform
    System::get_property('platform').downcase
  end

  def selected(option_value,object_value)
    "selected=\"yes\"" if option_value == object_value
  end

  def checked(option_value,object_value)
    "checked=\"yes\"" if option_value == object_value
  end

  def is_bb6
    platform == 'blackberry' && (System::get_property('os_version').split('.')[0].to_i >= 6)
  end

  def variants_input_type(variants)
    if variants.count{|v| v[:flag] == '1' } > 1
      'checkbox'
    else
      'radio'
    end
  end

  def question_url(map, num, answers)
    answers.each_with_index.inject("/app/Map/question/#{map.object}?num=#{num}") do |url, (question_answers, idx)|
      question_answers.each do |flag|
        url << "&a[#{idx}][]=#{flag}"
      end
      url
    end
  end

  def t(key)
    @lang ||= Control.find(:all, :conditions => {'name' => 'lang'}).first.value
    translation = if @lang == 'ua'
      translations_ua[key]
    elsif @lang == 'ru'
      translations_ru[key]
    else
      translations_en[key]
    end
    translation.nil? ? key : translation
  end

  def translations_ru
    @translations_ru ||= {
      # PLACEHOLDER: Atlas Title ru, e.g. 'Atlas' => 'СОЦИАЛЬНО-ЭКОНОМИЧЕСКАЯ ГЕОГРАФИЯ МИРА',
      # General
      'Controls' => 'Настройки',
      'Content' => 'Содержание',
      'Back' => 'Назад',
      'Prev' => 'Пред.',
      'Next' => 'След.',
      'Again' => 'Еще раз',
      'Continue' => 'Далее',
      'Update' => 'Сохранить',
      'Results' => 'Результат',
      # Controls
      'lang' => 'Язык',
      'ru' => 'русский',
      'ua' => 'украинский',
      'en' => 'английский',
      'icon_size' => 'Размер иконок',
      'small' => 'небольшие',
      'normal' => 'нормальные',
      'zoom_step' => 'Шаг масштаба',
      'show_controls_icon' => 'Показывать иконку настроек в режиме просмотра карты',
      # Demo
      'demo_content' => '<p>Это демо-версия мобильного приложения.</p>
<p>Этот раздел не доступен в демо-версии.</p>
<p>Пожалуйста, скачайте платную версию, чтобы просмотреть этот раздел.</p>
<p>Вы можете поддержать развитие мобильного приложения, загрузив полную версию.</p>
<p>Загрузка полной версии мобильного приложения может иметь положительное влияние на качество учебных материалов от разработчиков в будущем.</p>',
    }
  end

  def translations_ua
    @translations_ua ||= {
      # PLACEHOLDER: Atlas Title ua, e.g. 'Atlas' => 'СОЦІАЛЬНО-ЕКОНОМІЧНА ГЕОГРАФІЯ СВІТУ',
      # General
      'Controls' => 'Налаштування',
      'Content' => 'Зміст',
      'Back' => 'Назад',
      'Prev' => 'Попер.',
      'Next' => 'Наступ.',
      'Again' => 'Ще раз',
      'Continue' => 'Далі',
      'Update' => 'Зберегти',
      'Results' => 'Результат',
      # Controls
      'lang' => 'Мова',
      'ru' => 'російська',
      'ua' => 'українська',
      'en' => 'англійська',
      'icon_size' => 'Розмір іконок',
      'small' => 'невеликі',
      'normal' => 'нормальні',
      'zoom_step' => 'Крок масштабу',
      'show_controls_icon' => 'Показувати іконку налаштувань в режимі перегляду карти',
      # Demo
      'demo_content' => '<p>Це демо-версія мобільного додатку.</p>
<p>Цей розділ не доступний в демо-версії.</p>
<p>Будь ласка, скачайте платну версію, щоб переглянути цей розділ.</p>
<p>Ви можете підтримати розвиток мобільного додатку, завантаживши повну версію.</p>
<p>Завантаження повної версії мобільного додатку може мати позитивний вплив на якість навчальних матеріалів від розробників в майбутньому.</p>',
    }
  end

  def translations_en
    @translations_en ||= {
      # PLACEHOLDER: Atlas Title ru, e.g. 'Atlas' => 'SOCIO-ECONOMIC GEOGRAPHY OF THE WORLD',
      # General
      'Controls' => 'Settings',
      'Content' => 'Content',
      'Back' => 'Back',
      'Prev' => 'Prev.',
      'Next' => 'Next',
      'Again' => 'Again',
      'Continue' => 'Continue',
      'Update' => 'Save',
      'Results' => 'Results',
      # Controls
      'lang' => 'Language',
      'ru' => 'russian',
      'ua' => 'ukrainian',
      'en' => 'english',
      'icon_size' => 'Size of icons',
      'small' => 'Small',
      'normal' => 'Normal',
      'zoom_step' => 'Zoom step',
      'show_controls_icon' => 'Show settings icon in map view',
      # Demo
      'demo_content' => '<p>This is demo version of mobile app.</p>
<p>This section is not available in demo version.</p>
<p>Please download the paid version to view this section.</p>
<p>You can support the development of mobile application by downloading the full version.</p>
<p>Downloading the full version of the mobile app can have a positive impact on the quality of educational materials from developers in the future.</p>',
    }
  end

  def map_file_ext
    # PLACEHOLDER: map files ext, e.g. 'png'
  end
end
