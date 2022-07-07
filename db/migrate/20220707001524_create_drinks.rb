class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.string :name
      t.integer :quantity
      t.boolean :alcohol

      t.timestamps
    end
  end
end
 
