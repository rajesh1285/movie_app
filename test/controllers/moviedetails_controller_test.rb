require 'test_helper'

class MoviedetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get details" do
    get moviedetails_details_url
    assert_response :success
  end

end
