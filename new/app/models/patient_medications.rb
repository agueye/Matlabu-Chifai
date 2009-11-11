class PatientMedications < ActiveRecord::Base
  belongs_to :medication
  belongs_to :patient
  belongs_to :doctor
  belongs_to :condition
end
