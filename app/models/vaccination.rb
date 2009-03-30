class Vaccination < ActiveRecord::Base
	belongs_to :patient
end
