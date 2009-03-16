class Patient < ActiveRecord::Base

def self.search(query)
  unless query.to_s.strip.empty?
    find(:all, :conditions => ['first_name like ? or middle_name like ? or last_name like ?', "%#{query}%", "%#{query}%", "%#{query}%"], :order => "last_name desc", :limit => 25)
  else
    []
  end
end

end
