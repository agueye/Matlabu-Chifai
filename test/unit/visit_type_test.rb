require 'test_helper'

class VisitTypeTest < ActiveSupport::TestCase

  def setup
    @visit_type = visit_types(:one)
  end

  test "name must not be null" do
    test_attribute_may_not_be_null @visit_type, :name
  end

end
