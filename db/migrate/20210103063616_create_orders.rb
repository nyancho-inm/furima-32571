class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :postal,         null: false
      t.integer :prefecture_id, null: false
      t.string :municipalities, null: false
      t.string :address,        null: false
      t.string :building
      t.string :phone,          null: false
      t.references :record,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
