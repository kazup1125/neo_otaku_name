# frozen_string_literal: true

require 'test_helper'

class OtakuWordsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get otaku_words_index_url
    assert_response :success
  end

  test 'should get show' do
    get otaku_words_show_url
    assert_response :success
  end
end
