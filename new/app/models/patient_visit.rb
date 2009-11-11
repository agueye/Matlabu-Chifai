class PatientVisit < ActiveRecord::Base
  belongs_to :patient
  belongs_to :doctor
  belongs_to :visit_type
  belongs_to :condition
end
