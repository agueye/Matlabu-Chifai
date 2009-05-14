class Patient < ActiveRecord::Base
 
  has_attached_file :photo,
      :url => "/:class/:attachment/:id/:style_:basename.:extension",
      :path => ":rails_root/public/:class/:attachment/:id/:style_:basename.*.*",
      :default_url => "/:class/:attachment/missing_photo.jpg",
      :styles => {:thumb=> "100x100>", :small  => "150x150>", :tiny => "50x50#", :medium => "250x250>" }
      

  has_many :patient_notes, :dependent => :destroy
  has_many :patient_alerts, :dependent => :destroy
  has_many :patient_visits, :dependent => :destroy
  has_many :patient_conditions, :through => :patient_visits
  has_many :patient_medications, :dependent => :destroy
  has_many :patient_allergies, :dependent => :destroy
  has_many :patient_vaccinations, :dependent => :destroy
  has_many :visiting_doctors, :through => :patient_visits
  has_many :medicating_doctors, :through => :patient_medications
  #set fields to encrypt in a patient object
  encrypt :medical_record_number, :gender, :address, :city, :state, :zip, :father_first_name, :father_last_name, :mother_first_name, :mother_last_name, :telephone, :emergency_contact_name, :emergency_contact_relationship, :emergency_contact_number, :notes

  
  #validates_presence_of :first_name
  validates_presence_of :last_name  
  validates_presence_of :gender
  #validates_presence_of :date_of_birth
  validates_presence_of :arrival_date
  validates_presence_of :medical_record_number
  
  #validates_uniqueness_of :first_name, 
        #:scope => [:middle_name, :last_name], 
        #:message => 'first name, middle name and last name combination is already in our database. Please enter a unique patient name.'
  
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
    
end