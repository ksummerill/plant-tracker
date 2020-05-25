class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.string :amount_of_sun
      t.string :water_frequency
      t.integer :gardener_id
    end
  end
end
