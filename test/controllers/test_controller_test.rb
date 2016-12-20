require 'test_helper'

class TestControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get test_index_url
    assert_response :success
  end

  test "should get add" do
    get test_add_url
    assert_response :success
  end

  test "should get delete" do
    get test_delete_url
    assert_response :success
  end

end
