require "test_helper"

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  test "should get controller" do
    get employees_controller_url
    assert_response :success
  end
end
