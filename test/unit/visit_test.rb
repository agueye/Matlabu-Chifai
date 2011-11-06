require 'test_helper'

class VisitTest < ActiveSupport::TestCase

  def setup
    @visit = visits(:one)
  end

  test "date must not be null" do
    test_attribute_may_not_be_null @visit, :date
  end

end
