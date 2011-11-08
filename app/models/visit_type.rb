class VisitType < ActiveRecord::Base
  has_many :visits, :dependent => :destroy

  validates_presence_of :name
end
