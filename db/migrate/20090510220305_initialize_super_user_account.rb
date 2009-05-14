class InitializeSuperUserAccount < ActiveRecord::Migration
  def self.up
  	@login = "admin"
  	@password = "admin"
  	
  	#Generate EzCrypto key
  	@masterKey = EzCrypto::Key.generate.to_s
  	@encryptedKey = EzCrypto::Key.encrypt_with_password @password, "system salt", @masterKey
  	
  	#Create first admin
    User.create!( 
      :login => @login, 
      :first_name => "Administrator",
      :last_name => "Administrator", 
      :password => @password, 
      :password_confirmation => @password ,
      :encryptedKey => @encryptedKey)
    @adminuser = User.find_by_login(@login)
    @adminuser.is_admin = 1
    @adminuser.save!
   end                                      
   
  def self.down
    User.find(:first, :conditions => { :login => @login }).destroy
  end
end
