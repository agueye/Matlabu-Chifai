class Patient < ActiveRecord::Base
  has_many :alerts
  has_many :notes
  has_many :visits
  has_many :vaccinations
  has_many :allergies
  
  
	def self.search(query)
		if !query.to_s.strip.empty?
			tokens = query.split.collect {|c| "%#{c.downcase}%"}
			find_by_sql(["SELECT * from patients WHERE active = 't' AND #{ (["(LOWER(first_name) LIKE ? OR LOWER(middle_name) LIKE ? OR LOWER(last_name) LIKE ?)"] * tokens.size).join(" AND ") } ORDER by last_name ", *tokens.collect { |token| [token] * 3 }.flatten])
		else
			[]
		end
	end
  
  
end
