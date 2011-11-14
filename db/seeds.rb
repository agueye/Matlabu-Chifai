# This file should contain all the record creation needed to seed ithe database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

tier = Institution.create(:name => 'TIER')
sdm = Hospital.create(:name => 'Sutardja Dai Memorial', :institution => tier)
brian = Doctor.create(:name => 'Brian Maissy', :institution => tier)
hussein = Doctor.create(:name => 'Hussein Kadiri', :institution => tier)
holden = Patient.create(:name => 'Holden Caulfield', :hospital => sdm)
allie = Patient.create(:name => 'Allie Caulfield', :hospital => sdm)
fluevacc = Vaccine.create(:name => 'Flu Vaccine', :notes => 'notes')
sickcond = Condition.create(:name => 'Sick')
#testmed = Medication.create()
Alert.create(:title => 'A little depressed', :patient => holden)
Alert.create(:title => 'Check him for frostbite', :patient => holden)
Alert.create(:title => 'No signs of life', :patient => allie)
