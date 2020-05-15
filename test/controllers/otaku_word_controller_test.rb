require 'test_helper'

class OtakuWordControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get otaku_word_index_url
    assert_response :success
  end

  test "should get show" do
    get otaku_word_show_url
    assert_response :success
  end

end
