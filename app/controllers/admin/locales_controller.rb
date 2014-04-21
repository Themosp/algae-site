module Admin
  class LocalesController < BaseController
    before_action :set_locale_resource, only: [:show, :edit, :update, :destroy]

    # GET /locales
    def index
      @locales = Locale.all
    end

    # GET /locales/1
    def show
    end

    # GET /locales/new
    def new
      @locale = Locale.new
    end

    # GET /locales/1/edit
    def edit
    end

    # POST /locales
    def create
      @locale = Locale.new(locale_params)

      if @locale.save
        redirect_to [:admin, @locale], notice: 'Locale was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /locales/1
    def update
      if @locale.update(locale_params)
        redirect_to [:admin, @locale], notice: 'Locale was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /locales/1
    def destroy
      @locale.destroy
      redirect_to [:admin, :locales], notice: 'Locale was successfully destroyed.'
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_locale_resource
      @locale = Locale.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def locale_params
      params.require(:locale).permit(:title, :code, :active)
    end
  end
end
