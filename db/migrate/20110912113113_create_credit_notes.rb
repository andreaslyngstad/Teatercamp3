class CreateCreditNotes < ActiveRecord::Migration
   def self.up
    create_table :credit_notes do |t|
      t.integer :invoice_id
      t.float :total

      t.timestamps
    end
  end
  def self.down
    drop_table :credit_notes
  end
end
