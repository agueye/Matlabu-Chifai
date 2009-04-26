class PatientNote < ActiveRecord::Base
  belongs_to :patient
  
  validates_presence_of :patient
  validates_presence_of :note_date
  validates_presence_of :body
  
  validates_length_of   :body, 
                        :maximum => 10000, :allow_blank => true  
  
  #validates_date        :note_date, :allow_nil => true
end
