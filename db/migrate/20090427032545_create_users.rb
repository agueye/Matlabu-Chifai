class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.column :login,                     :string, :null => false
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :first_name,                :string, :limit => 80, :null => false
      t.column :last_name,                 :string, :limit => 80, :null => false
      t.column :is_admin,                  :integer
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string
      t.column :remember_token_expires_at, :datetime
      
      
    end
  end

  def self.down
    drop_table "users"
  end
end
