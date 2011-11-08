class Condition < ActiveRecord::Base
  has_and_belongs_to_many :vaccines
  has_and_belongs_to_many :patients
  has_many :prescriptions  

  validates_presence_of :name
  validates_uniqueness_of :name

end
