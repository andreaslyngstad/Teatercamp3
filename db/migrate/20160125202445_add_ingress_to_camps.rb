class AddIngressToCamps < ActiveRecord::Migration
  def self.up
  	add_column :camps, :ingress, :text   
  end

  def self.down
  	remove_column :camps, :ingress
  end
end
