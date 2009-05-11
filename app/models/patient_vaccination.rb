class PatientVaccination < ActiveRecord::Base
  belongs_to :patient
  belongs_to :vaccination
  encrypt :notes
  #validates_presence_of :patient
  validates_presence_of :vaccination
  #validates_presence_of :date_admined
  
  validates_length_of   :notes, :maximum => 10000, :allow_blank => true  
  
  #validates_date        :date_admined, :allow_nil => true
end
