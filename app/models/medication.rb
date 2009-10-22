class Medication < ActiveRecord::Base
  has_many :patient_medications, :dependent => :destroy
  has_many :patients, :through => :patient_medications
  
  validates_presence_of   :name
  validates_uniqueness_of :name, 
        :message => 'is already in our database. Please enter a unique medicine name.'
  
  validates_length_of     :name, :maximum => 100, :allow_blank => true
  validates_length_of     :notes, :maximum => 10000, :allow_blank => true      
end
