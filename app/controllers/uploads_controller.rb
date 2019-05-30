class UploadsController < ApplicationController
  def new
  	if current_user
  		@upload = Upload.new(user_id: current_user.id)
    	@user = current_user
    else
    	redirect_to root_path
    end
    
  end

  def show
  	@user = current_user
  	@uploads = @user.uploads
  end

  def create
     @upload = Upload.new(user_id: current_user.id)

   if @upload.save
     #iterate through each of the files
     params[:upload][:document].each do |file|
         @upload.documents.create!(:document => file)
         #create a document associated with the item that has just been created

     end
     render :show
   else
     render json: @upload.errors, status: :unprocessable_entity
   end

  end

  # def patch
  #    @document = Document.new(document_params)

  #  if @document.save
  #    #iterate through each of the files
  #    params[:document][:document_data].each do |file|
  #        @document.documents.create!(:document => file)
  #        #create a document associated with the item that has just been created
  #    end
  #    render :show
  #  else
  #    render json: @document.errors, status: :unprocessable_entity
  #  end

  # end
  def upload_params
  	params.require(:upload).permit(:name, :description , :document, :original_filename, :temp_file) # Add :picture as a permitted parameter
  end


end