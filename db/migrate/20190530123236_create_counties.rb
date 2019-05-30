class CreateCounties < ActiveRecord::Migration[5.2]
  def change
    create_table :counties do |t|
      t.integer :city_id
      t.string :name
      t.string :zip

      t.timestamps
    end
  end
end
