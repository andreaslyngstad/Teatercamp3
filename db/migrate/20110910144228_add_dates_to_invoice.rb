class AddDatesToInvoice < ActiveRecord::Migration
  def self.up
    add_column :invoices, :paid, :boolean
    add_column :invoices, :sent, :boolean
    add_column :invoices, :made_date, :datetime
    add_column :invoices, :pay_by, :datetime
   
  end

  def self.down
    remove_column :invoices, :paid
    remove_column :invoices, :sent
    remove_column :invoices, :made_date
    remove_column :invoices, :pay_by
   
  end
end
