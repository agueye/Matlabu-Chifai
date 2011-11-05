class Allergy < ActiveRecord::Base
 has_and_belongs_to_many :allergens

 validates_presence_of :reaction, :recorded

end
