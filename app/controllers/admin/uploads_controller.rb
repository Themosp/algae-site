module Admin
  class UploadsController < BaseController
    before_action :set_upload, only: [:show, :edit, :update, :destroy]

    # GET /uploads
    def index
      @uploads = Upload.all
    end

    # GET /uploads/1
    def show
    end

    # GET /uploads/new
    def new
      @upload = Upload.new
    end

    # GET /uploads/1/edit
    def edit
    end

    # POST /uploads
    def create
      @upload = Upload.new(upload_params)

      if @upload.save
        redirect_to [:admin, @upload], notice: 'Upload was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /uploads/1
    def update
      if @upload.update(upload_params)
        redirect_to [:admin, @upload], notice: 'Upload was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /uploads/1
    def destroy
      @upload.destroy
      redirect_to [:admin, :uploads], notice: 'Upload was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def upload_params
      params.require(:upload).permit(:title)
    end
  end
end
