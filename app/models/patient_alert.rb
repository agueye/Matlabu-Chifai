class PatientAlert < ActiveRecord::Base
  belongs_to :patient
  encrypt :notes
  validates_presence_of :patient
  validates_presence_of :alert_date
  validates_presence_of :notes
  encrypt :notes
  validates_length_of   :notes, 
                        :maximum => 10000, :allow_blank => true  
  
  #validates_date        :alert_date, :allow_nil => true
end
