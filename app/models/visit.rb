class Visit < ActiveRecord::Base
	belongs_to :patient
	
	def self.search(query)
		if !query.to_s.strip.empty?
			tokens = query.split.collect {|c| "%#{c.downcase}%"}
			find_by_sql(["SELECT * from visits WHERE #{ (["(LOWER(reason) LIKE ?)"] * tokens.size).join(" AND ") } ORDER by reason ", *tokens.collect { |token| [token] * 1 }.flatten])
		else
			[]
		end
	end
end
