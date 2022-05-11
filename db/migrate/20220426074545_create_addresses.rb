class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references  :purchase,      foreign_key: true,null: false
      t.string      :post_code,     null: false
      t.integer     :ship_from_id,  null: false
      t.string      :city,          null: false
      t.string      :building
      t.string      :tell,          null: false
      t.string      :house_number,  null: false
      t.timestamps
    end
  end
end

