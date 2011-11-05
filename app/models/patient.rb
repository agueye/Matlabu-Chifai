class Patient < ActiveRecord::Base
  belongs_to :hospital
  has_many :alerts, :dependent => :destroy
  has_and_belongs_to_many :conditions  

  validates_presence_of :name
end
