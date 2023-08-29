require 'test_helper'

class CaissesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @caiss = caisses(:one)
  end

  test "should get index" do
    get caisses_url
    assert_response :success
  end

  test "should get new" do
    get new_caiss_url
    assert_response :success
  end

  test "should create caiss" do
    assert_difference('Caiss.count') do
      post caisses_url, params: { caiss: { amount: @caiss.amount, end_date: @caiss.end_date, start_date: @caiss.start_date } }
    end

    assert_redirected_to caiss_url(Caiss.last)
  end

  test "should show caiss" do
    get caiss_url(@caiss)
    assert_response :success
  end

  test "should get edit" do
    get edit_caiss_url(@caiss)
    assert_response :success
  end

  test "should update caiss" do
    patch caiss_url(@caiss), params: { caiss: { amount: @caiss.amount, end_date: @caiss.end_date, start_date: @caiss.start_date } }
    assert_redirected_to caiss_url(@caiss)
  end

  test "should destroy caiss" do
    assert_difference('Caiss.count', -1) do
      delete caiss_url(@caiss)
    end

    assert_redirected_to caisses_url
  end
end
