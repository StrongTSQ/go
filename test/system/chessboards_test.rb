require "application_system_test_case"

class ChessboardsTest < ApplicationSystemTestCase
  setup do
    @chessboard = chessboards(:one)
  end

  test "visiting the index" do
    visit chessboards_url
    assert_selector "h1", text: "Chessboards"
  end

  test "creating a Chessboard" do
    visit chessboards_url
    click_on "New Chessboard"

    fill_in "Dimension", with: @chessboard.dimension
    fill_in "Theme", with: @chessboard.theme
    click_on "Create Chessboard"

    assert_text "Chessboard was successfully created"
    click_on "Back"
  end

  test "updating a Chessboard" do
    visit chessboards_url
    click_on "Edit", match: :first

    fill_in "Dimension", with: @chessboard.dimension
    fill_in "Theme", with: @chessboard.theme
    click_on "Update Chessboard"

    assert_text "Chessboard was successfully updated"
    click_on "Back"
  end

  test "destroying a Chessboard" do
    visit chessboards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Chessboard was successfully destroyed"
  end
end
