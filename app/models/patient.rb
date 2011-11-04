class Patient < ActiveRecord::Base
  belongs_to :hospital
  has_many :alerts, :dependent => :destroy
  has_many :visits, :dependent => :destroy
  
  validates_presence_of :name
end
