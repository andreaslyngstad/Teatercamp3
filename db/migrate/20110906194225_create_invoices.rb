class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.integer :registration_id
      t.integer :number
      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
