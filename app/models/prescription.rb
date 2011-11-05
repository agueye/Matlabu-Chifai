class Prescription < ActiveRecord::Base
  belongs_to :medications
  has_many :conditions

#  belongs_to :conditions
end
