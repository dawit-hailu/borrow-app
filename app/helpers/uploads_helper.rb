module UploadsHelper
	require 'csv'
	require 'fileutils'
	def csv_parse file_path
	  
	    csv = CSV.read(file_path)

	    csv.each do |row|
	    	State.create!(abreviation: row[0], name: row[1])
	    end

	end
	def save_file file_path, file_name, user_id, upload_id

		FileUtils.cp(file_path.path, 'app/assets/uploaded_files')
		ext = File.extname(file_path.path)        # => ".mp4"
        base_name = File.basename(file_path.path)

		new_file_name = DateTime.now.month.to_s + 
						DateTime.now.day.to_s   +
						DateTime.now.year.to_s  +
						user_id.to_s   +
						upload_id.to_s + 
						ext

		new_path = 'app/assets/uploaded_files/' + base_name
		File.rename(new_path, 'app/assets/uploaded_files/' + new_file_name)

	    new_file_name
	end

	def download upload_id
		@upload = current_user.uploads.find(upload_id)
        file_path = 'app/assets/uploaded_files/'+@upload.file_name
		send_file file_path, :disposition => 'attachment'
	end
end