class CreateAdminAccount < ActiveRecord::Migration
  
def self.up
  down
  adm = User.create(:login => "admin",
								 :first_name => "Assane",
								 :last_name => "Gueye",
								 :password => "adminadmin",
								 :password_confirmation => "adminadmin",
								 :email => "assane.gueye@gmail.com",
								 :is_admin => "1")

	adm.save!
	end

  def self.down
  #User.delete_all
  end
end