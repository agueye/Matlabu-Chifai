class Patient < ActiveRecord::Base
  has_many :visits
  has_many :vaccinations
  has_many :allergies
  
  #old
  def self.old_search(query)
    unless query.to_s.strip.empty?
       find(:all, :conditions => ['first_name like ? or middle_name like ? or last_name like ?', "%#{query}%", "%#{query}%", "%#{query}%"], :order => "last_name desc", :limit => 25)
    else
      []
    end
  end
  
  
	def self.search(query)
		if !query.to_s.strip.empty?
			tokens = query.split.collect {|c| "%#{c.downcase}%"}
			find_by_sql(["SELECT * from patients WHERE #{ (["(LOWER(first_name) LIKE ? OR LOWER(middle_name) LIKE ? OR LOWER(last_name) LIKE ?)"] * tokens.size).join(" OR ") } ORDER by last_name ", *tokens.collect { |token| [token] * 3 }.flatten])
		else
			[]
		end
	end
  
  
end
