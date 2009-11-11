require 'spec_helper'

describe PatientAllergies do
  before(:each) do
    @valid_attributes = {
      :allergy_id => 1,
      :patient_id => 1,
      :date_observed => Time.now,
      :severity => "value for severity",
      :reaction => "value for reaction",
      :notes => "value for notes"
    }
  end

  it "should create a new instance given valid attributes" do
    PatientAllergies.create!(@valid_attributes)
  end
end
