class Doctor < ActiveRecord::Base
  has_many :patient_visits, :dependent => :destroy
  has_many :patient_medications, :dependent => :destroy
  has_many :prescribed_patients, :through => :patient_medications
  has_many :treated_patients, :through => :patient_visits  
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  validates_uniqueness_of :first_name, 
        :scope => [:middle_name, :last_name], 
        :message => 'first name, middle name and last name combination is already in our database. Please enter a unique doctor name.'
  
  validates_length_of   :first_name, :maximum => 100, :allow_blank => true  
  validates_length_of   :middle_name, :maximum => 100, :allow_blank => true  
  validates_length_of   :last_name, :maximum => 100, :allow_blank => true
  validates_length_of   :notes, :maximum => 10000, :allow_blank => true  
end
