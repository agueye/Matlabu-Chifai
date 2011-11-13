class Allergen < ActiveRecord::Base

  validates_presence_of :name
  validate :val_side_effect

  def val_side_effect
   if :type == "Medication"
      self[:side_effect]
   else
      errors.add(:type, "is not a Medication, so it should not have side effects")
   end
  end 


end
