require 'test_helper'

class DoctorTest < ActiveSupport::TestCase

  def setup
    @doctor = doctors(:one)
    @doctor.institution = institutions(:one)
  end

  test "name must not be null" do
    test_attribute_may_not_be_null @doctor, :name
  end

  test "name must be unique in institution" do
    @doctor = Doctor.new(@doctor.attributes)
    test_attribute_must_be_unique @doctor, :name
  end

  test "name can repeat outside institution" do
    @doctor = Doctor.new(@doctor.attributes)
    assert @doctor.invalid?
    @doctor.institution = institutions(:two)
    assert @doctor.valid?
  end

end
