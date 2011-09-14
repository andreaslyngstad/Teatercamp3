class AddReminderDateToInvoices < ActiveRecord::Migration
   def self.up
    add_column :invoices, :reminder_date, :datetime   
  end

  def self.down
    remove_column :invoices, :reminder_date
  end
end
