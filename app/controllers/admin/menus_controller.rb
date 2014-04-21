module Admin
  class MenusController < BaseController
    before_action :set_menu, only: [:show, :edit, :update, :destroy]

    # GET /menus
    def index
      @menus = Menu.all
    end

    # GET /menus/1
    def show
    end

    # GET /menus/new
    def new
      @menu = Menu.new
    end

    # GET /menus/1/edit
    def edit
    end

    # POST /menus
    def create
      @menu = Menu.new(menu_params)

      if @menu.save
        redirect_to [:admin, @menu], notice: 'Menu was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /menus/1
    def update
      if @menu.update(menu_params)
        redirect_to [:admin, @menu], notice: 'Menu was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /menus/1
    def destroy
      @menu.destroy
      redirect_to [:admin, :menus], notice: 'Menu was successfully destroyed.'
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def menu_params
      params.require(:menu).permit(:title, linkables_menus_attributes: [ :id, :order, :depth, :linkable_id, :linkable_type, :_destroy ])
    end
  end
end
