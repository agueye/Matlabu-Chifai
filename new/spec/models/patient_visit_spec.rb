require 'spec_helper'

describe PatientVisit do
  before(:each) do
    @valid_attributes = {
      :patient_id => 1,
      :doctor_id => 1,
      :visit_type_id => 1,
      :condition_id => 1,
      :visit_date => Time.now,
      :height => "value for height",
      :weight => "value for weight",
      :systolic => "value for systolic",
      :diastolic => "value for diastolic",
      :pulse => "value for pulse",
      :temperature => "value for temperature",
      :notes => "value for notes"
    }
  end

  it "should create a new instance given valid attributes" do
    PatientVisit.create!(@valid_attributes)
  end
end
