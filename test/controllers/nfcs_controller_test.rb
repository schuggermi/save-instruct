require "test_helper"

class NfcsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get nfcs_new_url
    assert_response :success
  end
end
