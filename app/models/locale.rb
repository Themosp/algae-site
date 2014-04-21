class Locale < ActiveRecord::Base

  def self.current
    Locale.where(:code => I18n.locale).first
  end

  def self.current_globalize
    Locale.where(:code => Globalize.locale).first
  end
end
