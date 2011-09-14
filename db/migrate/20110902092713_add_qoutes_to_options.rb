class AddQoutesToOptions < ActiveRecord::Migration
  def self.up
    add_column :options, :quote1, :string
    add_column :options, :quote2, :string
    add_column :options, :quote3, :string
    add_column :options, :quote4, :string
  end

  def self.down
    remove_column :options, :quote1
    remove_column :options, :quote2
    remove_column :options, :quote3
    remove_column :options, :quote4
  end
end
