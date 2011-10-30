class Vaccine < ActiveRecord::Base
  has_and_belongs_to_many :conditions

  validates_presence_of :name, :notes
  validates_uniqueness_of :name  

end
