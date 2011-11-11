class Allergen < ActiveRecord::Base

  validates_presence_of :name

  def side_effect
   if :type == "Medication"
      self[:side_effect]
   else
      @flash['message'] = "Not a medication, should not have side effects"
   end
  end 


end
