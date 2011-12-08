class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :institution_id, :null => false
      t.string :email
      t.string :password_hash
      t.string :username
      t.integer :admin
      t.string :password_reset_token
      t.datetime :token_expiration
      
      t.timestamps
    end
  end
end
