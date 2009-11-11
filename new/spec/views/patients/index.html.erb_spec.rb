require 'spec_helper'

describe "/patients/index.html.erb" do
  include PatientsHelper

  before(:each) do
    assigns[:patients] = [
      stub_model(Patient,
        :medical_record_number => "value for medical_record_number",
        :first_name => "value for first_name",
        :middle_name => "value for middle_name",
        :last_name => "value for last_name",
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
      ),
      stub_model(Patient,
        :medical_record_number => "value for medical_record_number",
        :first_name => "value for first_name",
        :middle_name => "value for middle_name",
        :last_name => "value for last_name",
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
      )
    ]
  end

  it "renders a list of patients" do
    render
    response.should have_tag("tr>td", "value for medical_record_number".to_s, 2)
    response.should have_tag("tr>td", "value for first_name".to_s, 2)
    response.should have_tag("tr>td", "value for middle_name".to_s, 2)
    response.should have_tag("tr>td", "value for last_name".to_s, 2)
    response.should have_tag("tr>td", "value for gender".to_s, 2)
    response.should have_tag("tr>td", "value for address".to_s, 2)
    response.should have_tag("tr>td", "value for city".to_s, 2)
    response.should have_tag("tr>td", "value for state".to_s, 2)
    response.should have_tag("tr>td", "value for zip".to_s, 2)
    response.should have_tag("tr>td", "value for father_first_name".to_s, 2)
    response.should have_tag("tr>td", "value for father_last_name".to_s, 2)
    response.should have_tag("tr>td", "value for mother_first_name".to_s, 2)
    response.should have_tag("tr>td", "value for mother_last_name".to_s, 2)
    response.should have_tag("tr>td", "value for telephone".to_s, 2)
    response.should have_tag("tr>td", "value for emergency_contact_name".to_s, 2)
    response.should have_tag("tr>td", "value for emergency_contact_relation".to_s, 2)
    response.should have_tag("tr>td", "value for emergency_contact_number".to_s, 2)
    response.should have_tag("tr>td", "value for notes".to_s, 2)
    response.should have_tag("tr>td", "value for photo_file_url".to_s, 2)
    response.should have_tag("tr>td", "value for photo_content_type".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
