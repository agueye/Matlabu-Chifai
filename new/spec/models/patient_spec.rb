require 'spec_helper'

describe Patient do
  before(:each) do
    @valid_attributes = {
      :medical_record_number => "value for medical_record_number",
      :first_name => "value for first_name",
      :middle_name => "value for middle_name",
      :last_name => "value for last_name",
      :arrival_date => Time.now,
      :dob => Time.now,
      :gender => "value for gender",
      :address => "value for address",
      :city => "value for city",
      :state => "value for state",
      :zip => "value for zip",
      :father_first_name => "value for father_first_name",
      :father_last_name => "value for father_last_name",
      :mother_first_name => "value for mother_first_name",
      :mother_last_name => "value for mother_last_name",
      :telephone => "value for telephone",
      :emergency_contact_name => "value for emergency_contact_name",
      :emergency_contact_relation => "value for emergency_contact_relation",
      :emergency_contact_number => "value for emergency_contact_number",
      :notes => "value for notes",
      :photo_file_url => "value for photo_file_url",
      :photo_content_type => "value for photo_content_type",
      :photo_file_size => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Patient.create!(@valid_attributes)
  end
end
