class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    :login
      t.string    :crypted_password
      t.string    :password_salt
      t.string    :persistence_token
      t.integer   :login_count
      t.datetime  :last_request_at
      t.datetime  :last_login_at
      t.datetime  :current_login_at
      t.string    :last_login_ip
      t.string    :current_login_ip
      t.string    :perishable_token, :string, :default => "", :null => false
      t.string    :email, :string, :default => "", :null => false
      t.integer   :user_type_id

      t.timestamps
    end

    add_index :users, :perishable_token
    add_index :users, :email
  end

  def self.down
    drop_table :users
  end
end
