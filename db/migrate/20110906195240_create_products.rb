class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.float :total_price
      t.string :description
      t.float :vat
      t.integer :camp_id

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
