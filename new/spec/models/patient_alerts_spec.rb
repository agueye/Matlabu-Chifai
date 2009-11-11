require 'spec_helper'

describe PatientAlerts do
  before(:each) do
    @valid_attributes = {
      :patient_id => 1,
      :alert_date => Time.now,
      :notes => "value for notes"
    }
  end

  it "should create a new instance given valid attributes" do
    PatientAlerts.create!(@valid_attributes)
  end
end
