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

  def language_flag(locale)
    {
        el: 'flags/Greece.png',
        en: 'flags/UnitedKingdom.png',
        de: 'flags/Germany.png',
        it: 'flags/Italy.png',
        es: 'flags/Spain.png',
        ar: 'flags/SaudiArabia.png'
    }[locale]
  end
end
