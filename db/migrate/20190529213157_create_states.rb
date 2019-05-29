class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
        t.integer :state_id
    	t.string :name
    	t.string :abbreviation

      t.timestamps
    end
  end
end
