class Condition < ActiveRecord::Base
  has_many :patient_visits, :dependent => :destroy
  has_many :patient_medications, :dependent => :destroy
  has_many :visit_patients, :through => :patient_visits
  has_many :medication_patients, :through => :patient_medications
  
  encrypt :name, :notes
  validates_presence_of :name
  
  validates_uniqueness_of :name, 
        :message => 'is already in our database. Please enter a unique condition name.'
  
  validates_length_of   :name, :maximum => 100, :allow_blank => true
  validates_length_of   :notes, :maximum => 10000, :allow_blank => true  
end
