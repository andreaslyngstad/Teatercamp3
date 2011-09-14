class FixUsers < ActiveRecord::Migration
  def self.up
      add_column :users, :password_hash, :reminder_date, :string  
      add_column :users, :password_salt, :reminder_date, :string
      remove_column :users, :remember_token
      remove_column :users, :crypted_password
      remove_column :users, :remember_token_expires_at
    
  end

end
