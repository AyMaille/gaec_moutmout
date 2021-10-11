require 'test_helper'

class SheepsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get sheeps_show_url
    assert_response :success
  end

  test "should get index" do
    get sheeps_index_url
    assert_response :success
  end

end
