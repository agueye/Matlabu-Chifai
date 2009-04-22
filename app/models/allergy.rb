class Allergy < ActiveRecord::Base
	belongs_to :patient
	
	def self.search(query)
		if !query.to_s.strip.empty?
			tokens = query.split.collect {|c| "%#{c.downcase}%"}
			find_by_sql(["SELECT * from allergies WHERE #{ (["(LOWER(name) LIKE ?)"] * tokens.size).join(" AND ") } ORDER by name ", *tokens.collect { |token| [token] * 1 }.flatten])
		else
			[]
		end
	end
end
