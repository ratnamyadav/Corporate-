require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get companies_edit_url
    assert_response :success
  end

  test "should get update" do
    get companies_update_url
    assert_response :success
  end

end
