require 'test_helper'

class LotsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get lots_new_url
    assert_response :success
  end

end
