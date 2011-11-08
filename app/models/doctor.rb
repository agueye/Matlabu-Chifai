class Doctor < ActiveRecord::Base
  belongs_to :institution
  has_many :prescriptions   

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => [:institution_id]
end
