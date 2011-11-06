class CreateEncryptedConnections < ActiveRecord::Migration
  def change
    create_table :encrypted_connections do |t|
      t.string :public_key
      t.string :private_key

      t.timestamps
    end
  end
end
