require 'test_helper'

class TownHallsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get town_halls_show_url
    assert_response :success
  end

end
