class Condition < ActiveRecord::Base
  has_and_belongs_to_many :vaccines
  has_and_belongs_to_many :patients
 # belongs_to :prescriptions  

  validates_presence_of :name, :notes
  validates_uniqueness_of :name

end
