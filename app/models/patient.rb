class Patient < ActiveRecord::Base
  belongs_to :hospital
  
  validates_presence_of :name
end
