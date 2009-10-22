class PatientAllergy < ActiveRecord::Base
  belongs_to :patient
  belongs_to :allergy

  validates_presence_of :allergy
  
  validates_length_of   :reaction, :maximum => 254, :allow_blank => true
  validates_length_of   :severity, :maximum => 254, :allow_blank => true    
  validates_length_of   :notes, 
                        :maximum => 10000, :allow_blank => true  
  
  #validates_date        :date_observed, :allow_nil => true 
end
