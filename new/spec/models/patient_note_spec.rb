require 'spec_helper'

describe PatientNote do
  before(:each) do
    @valid_attributes = {
      :patient_id => 1,
      :note_date => Time.now,
      :body => "value for body"
    }
  end

  it "should create a new instance given valid attributes" do
    PatientNote.create!(@valid_attributes)
  end
end
