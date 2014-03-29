module Concerns
  module Localizable
    extend ActiveSupport::Concern

    included do
      before_filter :redirect_default_locale
      before_filter :set_locale
    end

    protected

    def redirect_default_locale
      if params[:locale].present? && params[:locale].to_sym == I18n.default_locale
        redirect_to params.merge! locale: nil, status: :moved_permanently
      end
    end

    def set_locale
      I18n.locale = params[:locale].presence || I18n.default_locale.presence
      Globalize.locale = params[:for_locale].presence || I18n.locale
    end

    def default_url_options
      {
          locale: (I18n.locale == I18n.default_locale ? nil : I18n.locale),
          for_locale: params[:for_locale].presence
      }.merge super
    end
  end
end
