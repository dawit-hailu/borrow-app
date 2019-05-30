class CreateUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.integer :file_id
      t.string :user_id
      t.string :file

      t.timestamps
    end
  end
end
