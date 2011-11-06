require 'test_helper'

class HospitalTest < ActiveSupport::TestCase

  def setup
    @hospital = hospitals(:one)
    @hospital.institution = institutions(:one)
  end

  test "name must not be null" do
    test_attribute_may_not_be_null @hospital, :name
  end

  test "name must be unique in institution" do
    @hospital = Hospital.new(@hospital.attributes)
    test_attribute_must_be_unique @hospital, :name
  end

  test "name can repeat outside institution" do
    @hospital = Hospital.new(@hospital.attributes)
    assert @hospital.invalid?
    @hospital.institution = institutions(:two)
    assert @hospital.valid?
  end
  
end
