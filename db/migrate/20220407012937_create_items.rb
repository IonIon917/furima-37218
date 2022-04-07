class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :introduction,           null: false
      t.string :item_name,            null: false
      t.integer :category_id,         null: false
      t.integer :status_id,           null: false
      t.integer :ship_from_id,        null: false
      t.integer :item_value,          null: false
      t.references :user,             null: false, foreign_key: true
      t.integer :delivery_charge_id,  null: false
      t.integer :days_to_ship_id,     null: false
      t.timestamps
    end
  end
end
