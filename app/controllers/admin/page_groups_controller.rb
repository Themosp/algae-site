module Admin
  class PageGroupsController < BaseController
    before_action :set_page_group, only: [:show, :edit, :update, :destroy]
    before_action :set_all_pages, only: [:new, :edit]

    # GET /admin/page_groups
    def index
      @page_groups = PageGroup.all.order(:id)
    end

    # GET /admin/page_groups/1
    def show
    end

    # GET /admin/page_groups/new
    def new
      @page_group = PageGroup.new
    end

    # GET /admin/page_groups/1/edit
    def edit
    end

    # POST /admin/page_groups
    def create
      @page_group = PageGroup.new(page_group_params)

      if @page_group.save
        redirect_to [:admin, @page_group], notice: 'Page group was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /admin/page_groups/1
    def update
      if @page_group.update(page_group_params)
        redirect_to [:admin, @page_group], notice: 'Page group was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /admin/page_groups/1
    def destroy
      @page_group.destroy
      redirect_to [:admin, :page_groups], notice: 'Page group was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_page_group
      @page_group = PageGroup.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def page_group_params
      params.require(:page_group).permit(:title, { page_ids: [] })
    end

    def set_all_pages
      @all_pages = Page.all.order(:id)
    end
  end
end
