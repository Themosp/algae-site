module Admin
  class ImagesController < BaseController
    before_action :set_image, only: [:show, :edit, :update, :destroy]

    # GET /images
    def index
      @images = Image.all
    end

    # GET /images/1
    def show
    end

    # GET /images/new
    def new
      @image = Image.new
    end

    # GET /images/1/edit
    def edit
    end

    # POST /images
    def create
      @image = Image.new(image_params)

      if @image.save
        redirect_to [:admin, @image], notice: 'Image was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /images/1
    def update
      if @image.update(image_params)
        redirect_to [:admin, @image], notice: 'Image was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /images/1
    def destroy
      @image.destroy
      redirect_to [:admin, :images], notice: 'Image was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def image_params
      params.require(:image).permit(:title, :image_attachment, :position_for_small, :position_for_very_small)
    end
  end
end
