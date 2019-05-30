class CreateUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :uploads do |t|
      t.string :user_id
      t.string :content_type
      t.string :file_name

      t.timestamps
    end
  end
end
