class Admin::BaseController < ApplicationController
  layout 'admin'

  def index
  end

  protected

  def default_url_options
    { :for_locale => (params[:for_locale].presence || default_locale) }.merge(super)
  end
end
