require 'test_helper'

class ProgramaEstudioControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get programa_estudio_index_url
    assert_response :success
  end

  test "should get new" do
    get programa_estudio_new_url
    assert_response :success
  end

end
