class Visit < ActiveRecord::Base
  belongs_to :visit_type

  validates_presence_of :date
end
