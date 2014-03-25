class PagesController < ApplicationController
  before_action :set_page, only: [:show]

  # GET /pages/1
  def show
    @page_title = @page.title
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_page
    @page = Page.find(params[:id])
  end
end
