class PatientMedication < ActiveRecord::Base
  belongs_to :patient
  belongs_to :medication
  belongs_to :doctor
  belongs_to :condition
  
  validates_presence_of     :patient
  validates_presence_of     :medication
  validates_presence_of     :doctor
  validates_presence_of     :condition
  validates_presence_of     :dosage
  validates_presence_of     :frequency
  validates_presence_of     :date_given
  
  #validates_date            :date_given, :allow_nil => true
  
  validates_length_of   :frequency, :maximum => 100, :allow_blank => true
  validates_length_of   :dosage, :maximum => 100, :allow_blank => true
  validates_length_of   :notes, :maximum => 10000, :allow_blank => true  
end
