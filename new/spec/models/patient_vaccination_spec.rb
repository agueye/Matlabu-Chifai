require 'spec_helper'

describe PatientVaccination do
  before(:each) do
    @valid_attributes = {
      :patient_id => 1,
      :vaccination_id => 1,
      :date_admined => Time.now,
      :notes => "value for notes"
    }
  end

  it "should create a new instance given valid attributes" do
    PatientVaccination.create!(@valid_attributes)
  end
end
