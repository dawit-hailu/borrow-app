class UploadsController < ApplicationController
  def new
  	if current_user
  		@upload = Upload.new(user_id: current_user.id)
    	@user = current_user
    else
    	redirect_to root_path
    end
    
  end

  def index
  	@user = current_user
  	@uploads = @user.uploads
  end

  def create
     @upload = Upload.new(user_id: current_user.id)

   if @upload.save
     #iterate through each of the files
     @upload.update(
      file: params[:upload][:file].tempfile,
      file_name: params[:upload][:file].original_filename,
      content_type: params[:upload][:file].content_type)
      #create a document associated with the item that has just been created
     render :index
   else
     render json: @upload.errors, status: :unprocessable_entity
   end

  end

  def upload_params
  	params.require(:upload).permit(:name, :description , :document, :original_filename, :temp_file) 
  end


end