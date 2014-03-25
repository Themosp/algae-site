class PageGroupsController < ApplicationController
  before_action :set_page_group, only: [:show]

  # GET /page_groups/1
  def show
    @page_title = @page_group.title
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_page_group
    @page_group = PageGroup.find(params[:id])
  end
end
