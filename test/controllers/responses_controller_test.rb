require 'test_helper'

class ResponsesControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get responses_add_url
    assert_response :success
  end

end
