class Medication < ActiveRecord::Base 
 
  has_many :prescriptions

end
