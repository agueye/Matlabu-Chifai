class Condition < ActiveRecord::Base
  has_and_belongs_to_many :vaccines
  
  validates_presence_of :name, :notes
  validates_uniqueness_of :name

end
