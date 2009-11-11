class PatientVaccination < ActiveRecord::Base
  belongs_to :patient
  belongs_to :vaccination
end
