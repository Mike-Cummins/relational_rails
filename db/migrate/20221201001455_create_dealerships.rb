class CreateDealerships < ActiveRecord::Migration[5.2]
  def change
    create_table :dealerships do |t|
      t.string :name
      t.boolean :offers_financing
      t.boolean :offers_shuttle
      t.integer :rating
      
      t.timestamps
    end
  end
end
