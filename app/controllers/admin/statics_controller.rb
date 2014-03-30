module Admin
  class StaticsController < BaseController
    before_action :set_static, only: [:show, :edit, :update, :destroy]

    # GET /statics
    def index
      @statics = Static.all.order(:id)
    end

    # GET /statics/1
    def show
    end

    # GET /statics/new
    def new
      @static = Static.new
    end

    # GET /statics/1/edit
    def edit
    end

    # POST /statics
    def create
      @static = Static.new(static_params)

      if @static.save
        redirect_to [:admin, @static], notice: 'Static was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /statics/1
    def update
      if @static.update(static_params)
        redirect_to [:admin, @static], notice: 'Static was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /statics/1
    def destroy
      @static.destroy
      redirect_to [:admin, :statics], notice: 'Static was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_static
      @static = Static.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def static_params
      params.require(:static).permit(:title, :action)
    end
  end
end
