class Allergy < ActiveRecord::Base
  has_many :patient_allergies, :dependent => :destroy
  has_many :patients, :through => :patient_allergies
  #encrypt :name, :notes
  
  validates_presence_of :name
  
  validates_uniqueness_of :name, 
        :message => 'is already in our database. Please enter a unique allergen name.'
  
  validates_length_of   :name, :maximum => 100, :allow_blank => true
  validates_length_of   :notes, :maximum => 10000, :allow_blank => true  
end
