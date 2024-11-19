require "test_helper"

class AsyncControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get async_index_url
    assert_response :success
  end
end
