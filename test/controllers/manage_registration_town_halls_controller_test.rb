require 'test_helper'

class ManageRegistrationTownHallsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get manage_registration_town_halls_new_url
    assert_response :success
  end

  test "should get create" do
    get manage_registration_town_halls_create_url
    assert_response :success
  end

end
