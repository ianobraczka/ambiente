require 'test_helper'

class AlbumControllerTest < ActionController::TestCase
  test "should get view_album" do
    get :view_album
    assert_response :success
  end

end
