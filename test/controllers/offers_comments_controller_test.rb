require 'test_helper'

class OffersCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get offers_comments_index_url
    assert_response :success
  end

  test "should get new" do
    get offers_comments_new_url
    assert_response :success
  end

  test "should get create" do
    get offers_comments_create_url
    assert_response :success
  end

  test "should get show" do
    get offers_comments_show_url
    assert_response :success
  end

  test "should get edit" do
    get offers_comments_edit_url
    assert_response :success
  end

  test "should get update" do
    get offers_comments_update_url
    assert_response :success
  end

end
