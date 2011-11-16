class Allergen < ActiveRecord::Base

  validates_presence_of :name
  validate :val_side_effect

  def val_side_effect 
#:type == "Medication" 
#   if :type == "Medication"
#      self[:side_effect]
#   else
      errors[:base] << "Type is not a Medication and should not access
                        side_effect" unless side_effect == nil
#      errors.add(:type, side_effect)
#"is not a Medication and should not access side_effect"
#   end
  end 


end
