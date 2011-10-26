class Hospital < ActiveRecord::Base
  belongs_to :institution
  has_many :patients, :dependent => :destroy
  
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => [:institution_id]
end
