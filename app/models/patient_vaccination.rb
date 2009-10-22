class PatientVaccination < ActiveRecord::Base
  belongs_to :patient
  belongs_to :vaccination

  validates_presence_of :vaccination
  validates_length_of   :notes, :maximum => 10000, :allow_blank => true  
end
