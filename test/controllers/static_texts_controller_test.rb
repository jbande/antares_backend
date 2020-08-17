require 'test_helper'

class StaticTextsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @static_text = static_texts(:one)
  end

  test "should get index" do
    get static_texts_url
    assert_response :success
  end

  test "should get new" do
    get new_static_text_url
    assert_response :success
  end

  test "should create static_text" do
    assert_difference('StaticText.count') do
      post static_texts_url, params: { static_text: {  } }
    end

    assert_redirected_to static_text_url(StaticText.last)
  end

  test "should show static_text" do
    get static_text_url(@static_text)
    assert_response :success
  end

  test "should get edit" do
    get edit_static_text_url(@static_text)
    assert_response :success
  end

  test "should update static_text" do
    patch static_text_url(@static_text), params: { static_text: {  } }
    assert_redirected_to static_text_url(@static_text)
  end

  test "should destroy static_text" do
    assert_difference('StaticText.count', -1) do
      delete static_text_url(@static_text)
    end

    assert_redirected_to static_texts_url
  end
end
