require 'test_helper'

class PatientTest < ActiveSupport::TestCase

  def setup
    @patient = patients(:one)
  end

  test "name must not be null" do
    test_attribute_may_not_be_null @patient, :name
  end

end
