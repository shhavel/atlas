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
    translation = (@lang == 'ua' ? translations_ua[key] : translations_ru[key])
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
      # Controls
      'lang' => 'Язык',
      'ru' => 'русский',
      'ua' => 'украинский',
      'icon_size' => 'Размер иконок',
      'small' => 'небольшие',
      'normal' => 'нормальные',
      'zoom_step' => 'Шаг масштаба',
      'show_controls_icon' => 'Показывать иконку настроек в режиме просмотра карты',
      # Unregistered
      'Unregistered version' => 'Незарегистрированная версия',
      'You need to register the application.' => 'Необходимо зарегистрировать приложение для прохождения тестирования.',
      'Go to page' => 'Зайдите на страницу',
      'Enter code' => 'Введите код',
      'Make the payment.' => 'Произведите оплату.',
      'The result has been sent and stored:' => 'Результат был отправлен и сохранен:',
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
      # Controls
      'lang' => 'Мова',
      'ru' => 'російська',
      'ua' => 'українська',
      'icon_size' => 'Розмір іконок',
      'small' => 'невеликі',
      'normal' => 'нормальні',
      'zoom_step' => 'Крок масштабу',
      'show_controls_icon' => 'Показувати іконку налаштувань в режимі перегляду карти',
      # Unregistered
      'Unregistered version' => 'Незареєстрована версія',
      'You need to register the application.' => 'Необхідно зареєструватися для проходження тестування.',
      'Go to page' => 'Зайдіть на сторінку',
      'Enter code' => 'Введіть код',
      'Make the payment.' => 'Проведіть оплату.',
      'The result has been sent and stored:' => 'Результат був відправлений і збережений:',
    }
  end

  def map_file_ext
    # PLACEHOLDER: map files ext, e.g. 'png'
  end
end
