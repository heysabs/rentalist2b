class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :item_type
      t.string :item_name
      t.text :description
      t.string :price
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
