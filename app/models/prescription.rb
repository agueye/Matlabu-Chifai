class Prescription < ActiveRecord::Base
  belongs_to :medication
  belongs_to :condition
  belongs_to :doctor

end
