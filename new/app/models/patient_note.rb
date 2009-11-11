class PatientNote < ActiveRecord::Base
  belongs_to :patient
end
