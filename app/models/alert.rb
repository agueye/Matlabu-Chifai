class Alert < ActiveRecord::Base
	attr_accessible :patient_id, :alert_date, :alert_note, :active
	belongs_to :patient
end
