class CreateUserAccount < ActiveRecord::Migration
  def self.up

  usr= User.create(:login => "tester",
								 :first_name => "Assane",
								 :last_name => "Gueye",
								 :password => "testtest",
								 :password_confirmation => "testtest",
								 :email => "assane.gueye@gmail.com",
								 :is_admin => "0")

	usr.save!
	end

  def self.down
  User.delete_all
  end
end