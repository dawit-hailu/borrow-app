class CreateCounties < ActiveRecord::Migration[5.2]
  def change
    create_table :counties do |t|
      t.integer :county_id
      t.integer :city_id
      t.string :county_name

      t.timestamps
    end
  end
end
