require 'test_helper'

class TopsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tops_new_url
    assert_response :success
  end

end
