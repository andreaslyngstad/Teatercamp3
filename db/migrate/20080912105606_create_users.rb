class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.column :login,                     :string, :limit => 40
      t.column :first_name,                :string, :limit => 100, :default => '', :null => true
      t.column :last_name,                 :string, :limit => 100, :default => '', :null => true
      t.column :email,                     :string, :limit => 100
      t.column :password_hash,             :string
      t.column :password_salt,             :string
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime

    end
    add_index :users, :login, :unique => true
  end

  def self.down
    drop_table "users"
  end
end
