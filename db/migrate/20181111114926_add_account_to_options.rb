class AddAccountToOptions < ActiveRecord::Migration
  def self.up
    add_column :options, :account, :string
    add_column :options, :vat_number, :string
  end

  def self.down
    remove_column :options, :account
    remove_column :options, :vat_number
  end
end
