require 'test_helper'

class AdvisorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get advisors_new_url
    assert_response :success
  end

end
