require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @institution = Institution.create(:name => "testInstitution")
    @user = User.new(:username => "testUser", :email => "testEmail", :institution => @institution, :admin => 0)
    @user.password = "testPassword"
    @user.save!
  end

  test "name must not be null" do
    test_attribute_may_not_be_null @user, :username
  end

  test "email must not be null" do
    test_attribute_may_not_be_null @user, :email
  end

  test "username must be unique" do
    @user = User.new(@user.attributes)
    test_attribute_must_be_unique @user, :username
  end

  test "password hash must not be null" do
    test_attribute_may_not_be_null @user, :password_hash
  end

  test "admin must be 0 or 1" do
    assert @user.valid?
    for number in MANY_NONINTEGERS
      @user.admin = number
      assert @user.invalid?
      assert @user.errors[:admin].include? "must be an integer"
    end
    for number in [-1,2,4,5]
      @user.admin = number
      assert @user.invalid?
      assert @user.errors[:admin].include? "must be 0 or 1"
    end
    for number in [0, 1]
      @user.admin = number
      assert @user.valid?
    end
  end
end
