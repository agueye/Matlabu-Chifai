# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

tier = Institution.create(:name => 'TIER')
user = User.new(:institution => tier, :email => 'dummyEmail', :username => 'admin', :admin => 1)
user.password = "password"
user.save
user = User.new(:institution => tier, :email => 'dummyEmail', :username => 'user', :admin => 0)
user.password = "password"
user.save
sdm = Hospital.create(:name => 'Sutardja Dai Memorial', :institution => tier)
brian = Doctor.create(:name => 'Brian Maissy', :institution => tier)
hussein = Doctor.create(:name => 'Hussein Kadiri', :institution => tier)
holden = Patient.create(:name => 'Holden Caulfield', :hospital => sdm)
allie = Patient.create(:name => 'Allie Caulfield', :hospital => sdm)
Alert.create(:title => 'A little depressed', :patient => holden)
Alert.create(:title => 'Check him for frostbite', :patient => holden)
Alert.create(:title => 'No signs of life', :patient => allie)
checkup = VisitType.create(:name => 'Checkup')
procedure = VisitType.create(:name => 'Procedure')
Visit.create(:visit_type => checkup, :doctor => brian, :patient => holden, :date => Date.yesterday)
Visit.create(:visit_type => checkup, :doctor => hussein, :patient => allie, :date => Date.yesterday)
Visit.create(:visit_type => procedure, :doctor => brian, :patient => holden, :date => Date.today)
