class Doctor < ActiveRecord::Base
  has_many :patient_visits, :dependent => :destroy
  has_many :patient_medications, :dependent => :destroy
  has_many :prescribed_patients, :through => :patient_medications
  has_many :treated_patients, :through => :patient_visits  
  
  encrypt :notes, :name
  validates_presence_of :name
  
  validates_uniqueness_of :name, :message => 'doctor name is already in our database. Please enter a unique doctor name.'
   
  validates_length_of   :name, :maximum => 100, :allow_blank => true
  validates_length_of   :notes, :maximum => 10000, :allow_blank => true  
end
