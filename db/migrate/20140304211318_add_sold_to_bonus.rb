class AddSoldToBonus < ActiveRecord::Migration
  def change
    add_column :bonus, :sold, :boolean
    add_index :bonus, [:code, :sold]
  end
end
