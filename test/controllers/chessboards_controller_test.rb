require 'test_helper'

class ChessboardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chessboard = chessboards(:one)
  end

  test "should get index" do
    get chessboards_url
    assert_response :success
  end

  test "should get new" do
    get new_chessboard_url
    assert_response :success
  end

  test "should create chessboard" do
    assert_difference('Chessboard.count') do
      post chessboards_url, params: { chessboard: { dimension: @chessboard.dimension, theme: @chessboard.theme } }
    end

    assert_redirected_to chessboard_url(Chessboard.last)
  end

  test "should show chessboard" do
    get chessboard_url(@chessboard)
    assert_response :success
  end

  test "should get edit" do
    get edit_chessboard_url(@chessboard)
    assert_response :success
  end

  test "should update chessboard" do
    patch chessboard_url(@chessboard), params: { chessboard: { dimension: @chessboard.dimension, theme: @chessboard.theme } }
    assert_redirected_to chessboard_url(@chessboard)
  end

  test "should destroy chessboard" do
    assert_difference('Chessboard.count', -1) do
      delete chessboard_url(@chessboard)
    end

    assert_redirected_to chessboards_url
  end
end
