module Admin
  class PagesController < BaseController
    before_action :set_page, only: [:show, :edit, :update, :destroy]
    before_action :set_all_images, only: [:edit, :new]
    before_action :set_all_back_links, only: [:edit, :new]

    # GET /pages
    def index
      @pages = Page.all
    end

    # GET /pages/1
    def show
    end

    # GET /pages/new
    def new
      @page = Page.new
    end

    # GET /pages/1/edit
    def edit
    end

    # POST /pages
    def create
      @page = Page.new(page_params)

      if @page.save
        redirect_to [:admin, @page], notice: 'Page was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /pages/1
    def update
      if @page.update(page_params)
        redirect_to [:admin, @page], notice: 'Page was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /pages/1
    def destroy
      @page.destroy
      redirect_to [:admin, :pages], notice: 'Page was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    def set_all_images
      @all_images = Image.all
    end

    def set_all_back_links
      @all_back_links = Page.all + PageGroup.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :title_link, :image_id, :big_image, :back_link_id, :back_link_type, :body)
    end
  end
end
