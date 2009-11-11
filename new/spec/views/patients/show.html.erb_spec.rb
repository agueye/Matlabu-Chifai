require 'spec_helper'

describe "/patients/show.html.erb" do
  include PatientsHelper
  before(:each) do
    assigns[:patient] = @patient = stub_model(Patient,
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
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ medical_record_number/)
    response.should have_text(/value\ for\ first_name/)
    response.should have_text(/value\ for\ middle_name/)
    response.should have_text(/value\ for\ last_name/)
    response.should have_text(/value\ for\ gender/)
    response.should have_text(/value\ for\ address/)
    response.should have_text(/value\ for\ city/)
    response.should have_text(/value\ for\ state/)
    response.should have_text(/value\ for\ zip/)
    response.should have_text(/value\ for\ father_first_name/)
    response.should have_text(/value\ for\ father_last_name/)
    response.should have_text(/value\ for\ mother_first_name/)
    response.should have_text(/value\ for\ mother_last_name/)
    response.should have_text(/value\ for\ telephone/)
    response.should have_text(/value\ for\ emergency_contact_name/)
    response.should have_text(/value\ for\ emergency_contact_relation/)
    response.should have_text(/value\ for\ emergency_contact_number/)
    response.should have_text(/value\ for\ notes/)
    response.should have_text(/value\ for\ photo_file_url/)
    response.should have_text(/value\ for\ photo_content_type/)
    response.should have_text(/1/)
  end
end
