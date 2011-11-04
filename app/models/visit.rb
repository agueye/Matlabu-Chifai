class Visit < ActiveRecord::Base
  belongs_to :visit_type
  belongs_to :doctor
  belongs_to :patient

  validates_presence_of :date

  def to_s
    return patient.name + " had a " + visit_type.name  + " with " + doctor.name + " on " + date.to_s
  end
end
