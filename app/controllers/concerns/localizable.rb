module Concerns
  module Localizable
    extend ActiveSupport::Concern

    included do
      before_filter :redirect_default_locale
      before_filter :require_settable_locale_param
      before_filter :set_locale
      before_filter :set_globalize_locale
      helper_method :available_locales
    end

    protected

    def redirect_default_locale
      if params[:locale].present? && params[:locale].to_sym == default_locale
        redirect_to params.merge! locale: nil, status: :moved_permanently
      end
    end

    def require_settable_locale_param
      locale_error unless locale_settable? params[:locale]
    end

    def set_locale
      I18n.locale = params[:locale].presence || default_locale
    end

    def default_locale
      :el
    end

    def enabled_locales
      [ :el, :en ]
    end

    def available_locales
      [ :el, :en, :de, :it, :es, :ar ]
    end

    def locale_settable?(locale)
      locale.blank? || (enabled_locales - [default_locale]).include?(locale.to_sym)
    end

    def locale_available?(locale)
      available_locales.include? locale.to_sym
    end

    def locale_error
      raise ActionController::RoutingError.new 'Bad locale setting'
    end

    def set_globalize_locale
      if params[:for_locale].present? && locale_available?(params[:for_locale])
        Globalize.locale = params[:for_locale]
      end
    end

    def default_url_options
      if I18n.locale.to_sym == default_locale
        { :locale => nil }.merge(super)
      else
        { :locale => I18n.locale }.merge(super)
      end
    end
  end
end
