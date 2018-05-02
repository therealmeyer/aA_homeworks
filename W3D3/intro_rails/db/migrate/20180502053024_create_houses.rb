class CreateHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.string :address, null: false
      t.timestamps
    end
    add_index :houses, :address
  end
end
