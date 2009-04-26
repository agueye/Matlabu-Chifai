class PatientVisit < ActiveRecord::Base
  belongs_to  :patient
  belongs_to  :doctor
  belongs_to  :visit_type
  belongs_to  :condition
  
  
  validates_presence_of :patient
  validates_presence_of :doctor
  validates_presence_of :visit_type
  validates_presence_of :condition
  validates_presence_of :visit_date  
  
  validates_length_of   :height, :maximum => 100, :allow_blank => true
  validates_length_of   :weight, :maximum => 100, :allow_blank => true
  validates_length_of   :blood_pressure, :maximum => 100, :allow_blank => true
  validates_length_of   :pulse, :maximum => 100, :allow_blank => true
  validates_length_of   :temperature, :maximum => 100, :allow_blank => true
  validates_length_of   :notes, :maximum => 10000, :allow_blank => true
  
  #validates_date  :visit_date, :allow_nil => true
end
