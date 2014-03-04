class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :bonus_storage
      t.string :status_storage
      t.string :image_url

      t.timestamps
    end
  end
end
