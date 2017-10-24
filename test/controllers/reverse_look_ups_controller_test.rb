require 'test_helper'

class ReverseLookUpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reverse_look_up = reverse_look_ups(:one)
  end

  test "should get index" do
    get reverse_look_ups_url
    assert_response :success
  end

  test "should get new" do
    get new_reverse_look_up_url
    assert_response :success
  end

  test "should create reverse_look_up" do
    assert_difference('ReverseLookUp.count') do
      post reverse_look_ups_url, params: { reverse_look_up: { keyWords: @reverse_look_up.keyWords, searchableKeys: @reverse_look_up.searchableKeys, title: @reverse_look_up.title } }
    end

    assert_redirected_to reverse_look_up_url(ReverseLookUp.last)
  end

  test "should show reverse_look_up" do
    get reverse_look_up_url(@reverse_look_up)
    assert_response :success
  end

  test "should get edit" do
    get edit_reverse_look_up_url(@reverse_look_up)
    assert_response :success
  end

  test "should update reverse_look_up" do
    patch reverse_look_up_url(@reverse_look_up), params: { reverse_look_up: { keyWords: @reverse_look_up.keyWords, searchableKeys: @reverse_look_up.searchableKeys, title: @reverse_look_up.title } }
    assert_redirected_to reverse_look_up_url(@reverse_look_up)
  end

  test "should destroy reverse_look_up" do
    assert_difference('ReverseLookUp.count', -1) do
      delete reverse_look_up_url(@reverse_look_up)
    end

    assert_redirected_to reverse_look_ups_url
  end
end
