# XXX/bowei -- this is wrong and shouldn't be a migration
class InitializeSuperUserAccount < ActiveRecord::Migration
  def self.up
    @login    = "admin"
    @password = "admin"
        
    #Create first admin
    User.create!( 
      :login => @login, 
      :first_name => "Administrator",
      :last_name => "Administrator", 
      :password => @password, 
      :password_confirmation => @password,
      :encryptedKey => "dummy")
    @adminuser = User.find_by_login(@login)
    @adminuser.is_admin = 1
    @adminuser.save!
  end                                      
  
  def self.down
    User.find(:first, :conditions => { :login => @login }).destroy
  end
end
