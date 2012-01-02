require 'test_helper'

class PatientTest < ActiveSupport::TestCase

  def setup
    @patient = patients(:one)
  end

  test "name must not be null" do
    test_attribute_may_not_be_null @patient, :name
  end

  test "search" do
    assert_equal 1, Patient.search("Bob").size
    assert_equal 2, Patient.search("smith").size
    assert_equal 0, Patient.search("none").size
  end

end
