class CreateCreditNotes < ActiveRecord::Migration
  def change
    create_table :credit_notes do |t|
      t.integer :invoice_id
      t.float :total

      t.timestamps
    end
  end
end
