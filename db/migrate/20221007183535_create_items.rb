# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :productid
      t.string :condition
      t.string :sku
      t.string :title
      t.integer :qty
      t.float :price

      t.timestamps
    end
  end
end
