module Concerns
  module Localizable
    extend ActiveSupport::Concern

    included do
      before_filter :redirect_default_locale
      before_filter :set_locale
    end

    protected

    def redirect_default_locale
      if locale_param && locale_param.to_sym == I18n.default_locale
        redirect_to params.merge! locale: nil, status: :moved_permanently
      end
    end

    def set_locale
      I18n.locale = locale_param || I18n.default_locale.presence
      Globalize.locale = params[:for_locale].presence || I18n.locale
    end

    def default_url_options
      {
          locale: (I18n.locale == I18n.default_locale ? nil : I18n.locale),
          for_locale: params[:for_locale].presence
      }.merge super
    end

    def locale_param
      params[:locale].present? && (params[:locale].is_a?(String) || params[:locale].is_a?(Symbol)) ?
          params[:locale] :
          nil
    end
  end
end
