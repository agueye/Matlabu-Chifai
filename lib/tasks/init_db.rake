namespace :mc do
  desc "Initialize database with starting data"
  task :init_db => :environment do
    puts "init db with starting data"
    if User.find_by_login("admin") == nil
      User.create!(:login        => "admin", 
                   :first_name   => "Administrator",
                   :last_name    => "Administrator", 
                   :password     => "admin", 
                   :password_confirmation => "admin",
                   :encryptedKey => "dummy")

      user = User.find_by_login("admin")
      user.is_admin = 1
      user.save!
      puts "created admin user"
    else
      puts "admin user already exists"
    end
  end
end # namespace mc
