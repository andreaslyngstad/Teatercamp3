class AddPaidToRegistrations < ActiveRecord::Migration
  def self.up
    add_column :registrations, :paid, :boolean
  end

  def self.down
    remove_column :registrations, :paid
  end
end
