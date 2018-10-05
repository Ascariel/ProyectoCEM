require 'test_helper'

class FamiliasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get familias_index_url
    assert_response :success
  end

end
