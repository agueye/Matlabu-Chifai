class Patient < ActiveRecord::Base
  has_many :patient_notes, :dependent => :destroy
  has_many :patient_alerts, :dependent => :destroy
  has_many :patient_visits, :dependent => :destroy
  has_many :patient_conditions, :through => :patient_visits
  has_many :patient_medications, :dependent => :destroy
  has_many :patient_allergies, :dependent => :destroy
  has_many :patient_vaccinations, :dependent => :destroy
  has_many :visiting_doctors, :through => :patient_visits
  has_many :medicating_doctors, :through => :patient_medications

  
  validates_presence_of :first_name
  validates_presence_of :last_name  
  validates_presence_of :gender
  validates_presence_of :date_of_birth
  validates_presence_of :arrival_date
  
  validates_uniqueness_of :first_name, 
        :scope => [:middle_name, :last_name], 
        :message => 'first name, middle name and last name combination is already in our database. Please enter a unique patient name.'
  
  #validates_date        :date_of_birth, :allow_nil => true
  #validates_date        :arrival_date, :allow_nil => true
  
  validates_length_of   :first_name, :maximum => 100, :allow_blank => true
  validates_length_of   :middle_name, :maximum => 100, :allow_blank => true
  validates_length_of   :last_name, :maximum => 100, :allow_blank => true
  validates_length_of   :city, :maximum => 100, :allow_blank => true
  validates_length_of   :address, :maximum => 100, :allow_blank => true
  validates_length_of   :state, :maximum => 100, :allow_blank => true
  validates_length_of   :zip, :maximum => 100, :allow_blank => true
  validates_length_of   :father_first_name, :maximum => 100, :allow_blank => true
  validates_length_of   :father_last_name, :maximum => 100, :allow_blank => true
  validates_length_of   :mother_first_name, :maximum => 100, :allow_blank => true
  validates_length_of   :mother_last_name, :maximum => 100, :allow_blank => true
  validates_length_of   :telephone, :maximum => 100, :allow_blank => true
  validates_length_of   :emergency_contact_name, :maximum => 100, :allow_blank => true
  validates_length_of   :emergency_contact_relationship, 
                        :maximum => 100, :allow_blank => true
  validates_length_of   :emergency_contact_number, 
                        :maximum => 100, :allow_blank => true  
  validates_length_of   :notes, :maximum => 10000, :allow_blank => true
  
  def self.search(query)
    if !query.to_s.strip.empty?
      tokens = query.split.collect {|c| "%#{c.downcase}%"}
        find_by_sql(["SELECT * from patients WHERE #{ (["(LOWER(first_name) LIKE ? OR LOWER(middle_name) LIKE ? OR LOWER(last_name) LIKE ?)"] * tokens.size).join(" AND ") } ORDER by last_name ", *tokens.collect { |token| [token] * 3 }.flatten])
	else
	  []
	end
  end
    
end
