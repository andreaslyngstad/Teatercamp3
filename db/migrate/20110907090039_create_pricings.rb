class CreatePricings < ActiveRecord::Migration
  def self.up
    create_table :pricings do |t|
      t.integer :camp_id
      t.integer :product_id
    end
  end

  def self.down
    drop_table :pricings
  end
end
