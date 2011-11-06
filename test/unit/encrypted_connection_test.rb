require 'test_helper'

class EncryptedConnectionTest < ActiveSupport::TestCase

  test "public key must be unique" do
    connection = EncryptedConnection.new(encrypted_connections(:one).attributes)
    test_attribute_must_be_unique(connection, :public_key)
  end

  test "set defaults works" do
    connection = EncryptedConnection.new
    assert connection.valid?
  end

  test "does not change by finding it" do
    connection = encrypted_connections(:one)
    assert_equal connection, EncryptedConnection.find_by_public_key(connection.public_key)
  end

  test "public and private key pair work properly" do
    #TODO: encrypt something and then decrypt it
    assert false
  end
  
end
