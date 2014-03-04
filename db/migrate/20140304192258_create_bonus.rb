class CreateBonus < ActiveRecord::Migration
  def change
    create_table :bonus do |t|
      t.string :code
      t.integer :product_id

      t.timestamps
    end
    add_index :bonus, :product_id
  end
end
