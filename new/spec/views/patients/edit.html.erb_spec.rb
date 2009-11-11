require 'spec_helper'

describe "/patients/edit.html.erb" do
  include PatientsHelper

  before(:each) do
    assigns[:patient] = @patient = stub_model(Patient,
      :new_record? => false,
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

  it "renders the edit patient form" do
    render

    response.should have_tag("form[action=#{patient_path(@patient)}][method=post]") do
      with_tag('input#patient_medical_record_number[name=?]', "patient[medical_record_number]")
      with_tag('input#patient_first_name[name=?]', "patient[first_name]")
      with_tag('input#patient_middle_name[name=?]', "patient[middle_name]")
      with_tag('input#patient_last_name[name=?]', "patient[last_name]")
      with_tag('input#patient_gender[name=?]', "patient[gender]")
      with_tag('input#patient_address[name=?]', "patient[address]")
      with_tag('input#patient_city[name=?]', "patient[city]")
      with_tag('input#patient_state[name=?]', "patient[state]")
      with_tag('input#patient_zip[name=?]', "patient[zip]")
      with_tag('input#patient_father_first_name[name=?]', "patient[father_first_name]")
      with_tag('input#patient_father_last_name[name=?]', "patient[father_last_name]")
      with_tag('input#patient_mother_first_name[name=?]', "patient[mother_first_name]")
      with_tag('input#patient_mother_last_name[name=?]', "patient[mother_last_name]")
      with_tag('input#patient_telephone[name=?]', "patient[telephone]")
      with_tag('input#patient_emergency_contact_name[name=?]', "patient[emergency_contact_name]")
      with_tag('input#patient_emergency_contact_relation[name=?]', "patient[emergency_contact_relation]")
      with_tag('input#patient_emergency_contact_number[name=?]', "patient[emergency_contact_number]")
      with_tag('textarea#patient_notes[name=?]', "patient[notes]")
      with_tag('input#patient_photo_file_url[name=?]', "patient[photo_file_url]")
      with_tag('input#patient_photo_content_type[name=?]', "patient[photo_content_type]")
      with_tag('input#patient_photo_file_size[name=?]', "patient[photo_file_size]")
    end
  end
end
