require 'test_helper'

class InstitutionTest < ActiveSupport::TestCase

  def setup
    @institution = institutions(:one)
  end

  test "name must not be null" do
    test_attribute_may_not_be_null @institution, :name
  end

  test "name must be unique" do
    @institution = Institution.new(@institution.attributes)
    test_attribute_must_be_unique @institution, :name
  end

end
