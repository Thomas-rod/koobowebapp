require 'test_helper'

class FlowsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get flows_index_url
    assert_response :success
  end

end
