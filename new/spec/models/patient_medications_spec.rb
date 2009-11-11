require 'spec_helper'

describe PatientMedications do
  before(:each) do
    @valid_attributes = {
      :medication_id => 1,
      :patient_id => 1,
      :doctor_id => 1,
      :condition_id => 1,
      :date_given => Time.now,
      :dosage => "value for dosage",
      :frequency => "value for frequency",
      :notes => "value for notes"
    }
  end

  it "should create a new instance given valid attributes" do
    PatientMedications.create!(@valid_attributes)
  end
end
