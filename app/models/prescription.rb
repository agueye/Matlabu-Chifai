class Prescription < ActiveRecord::Base
  belongs_to :medication
  belongs_to :doctor

  has_and_belongs_to_many :conditions
end
