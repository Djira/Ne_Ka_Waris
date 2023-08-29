require "application_system_test_case"

class CaissesTest < ApplicationSystemTestCase
  setup do
    @caiss = caisses(:one)
  end

  test "visiting the index" do
    visit caisses_url
    assert_selector "h1", text: "Caisses"
  end

  test "creating a Caiss" do
    visit caisses_url
    click_on "New Caiss"

    fill_in "Amount", with: @caiss.amount
    fill_in "End date", with: @caiss.end_date
    fill_in "Start date", with: @caiss.start_date
    click_on "Create Caiss"

    assert_text "Caiss was successfully created"
    click_on "Back"
  end

  test "updating a Caiss" do
    visit caisses_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @caiss.amount
    fill_in "End date", with: @caiss.end_date
    fill_in "Start date", with: @caiss.start_date
    click_on "Update Caiss"

    assert_text "Caiss was successfully updated"
    click_on "Back"
  end

  test "destroying a Caiss" do
    visit caisses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Caiss was successfully destroyed"
  end
end
