require 'spec_helper'

describe "/patient_visits/show.html.erb" do
  include PatientVisitsHelper
  before(:each) do
    assigns[:patient_visit] = @patient_visit = stub_model(PatientVisit,
      :patient => 1,
      :doctor => 1,
      :visit_type => 1,
      :condition => 1,
      :height => "value for height",
      :weight => "value for weight",
      :systolic => "value for systolic",
      :diastolic => "value for diastolic",
      :pulse => "value for pulse",
      :temperature => "value for temperature",
      :notes => "value for notes"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ height/)
    response.should have_text(/value\ for\ weight/)
    response.should have_text(/value\ for\ systolic/)
    response.should have_text(/value\ for\ diastolic/)
    response.should have_text(/value\ for\ pulse/)
    response.should have_text(/value\ for\ temperature/)
    response.should have_text(/value\ for\ notes/)
  end
end
