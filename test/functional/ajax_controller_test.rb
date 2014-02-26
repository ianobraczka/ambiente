require 'test_helper'

class AjaxControllerTest < ActionController::TestCase
  test "should get subsub_data" do
    get :subsub_data
    assert_response :success
  end

end
