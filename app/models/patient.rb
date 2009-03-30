class Patient < ActiveRecord::Base
  has_many :visits
  has_many :vaccinations
  has_many :allergies
  def self.search(query)
    unless query.to_s.strip.empty?
       find(:all, :conditions => ['first_name like ? or middle_name like ? or last_name like ?', "%#{query}%", "%#{query}%", "%#{query}%"], :order => "last_name desc", :limit => 25)
    else
      []
    end
  end
  
end
