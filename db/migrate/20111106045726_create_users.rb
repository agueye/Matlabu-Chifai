class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :institution_id, :null => false
      t.string :email
      t.string :password_hash
      t.string :name
      t.integer :admin

      t.timestamps
    end
  end
end
