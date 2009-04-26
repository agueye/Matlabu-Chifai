class VisitType < ActiveRecord::Base
  has_many  :patient_visits, :dependent => :destroy
  
  validates_presence_of :name
  
  validates_uniqueness_of :name, 
        :message => 'is already in our database. Please enter a unique visit type.'
  
  validates_length_of   :name, :maximum => 100, :allow_blank => true
  validates_length_of   :notes, :maximum => 10000, :allow_blank => true
end
