module ApplicationHelper
  def language_name(locale)
    {
        el: 'Greek',
        en: 'English',
        de: 'German',
        it: 'Italian',
        es: 'Spanish',
        ar: 'Arabic'
    }[locale]
  end
end
