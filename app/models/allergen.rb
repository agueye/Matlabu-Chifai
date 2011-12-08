class Allergen < ActiveRecord::Base

  validates_presence_of :name
  validate :val_side_effect

  def val_side_effect 
      errors[:base] << "Type is not a Medication and should not access
                        side_effect" unless side_effect == nil or side_effect =="" or :type == "Medication"
  end 


end
