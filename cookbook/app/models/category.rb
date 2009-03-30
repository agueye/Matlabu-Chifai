class Category < ActiveRecord::Base
  has_many :recipes
end
