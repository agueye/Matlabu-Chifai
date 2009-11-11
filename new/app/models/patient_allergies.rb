class PatientAllergies < ActiveRecord::Base
  belongs_to :allergy
  belongs_to :patient
end
