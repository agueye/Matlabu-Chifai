class Medication < ActiveRecord::Base 
  has_many :prescriptions 

   validates_presence_of :side_effect 
end
