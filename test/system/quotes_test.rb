require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit quotes_url
  #
  #   assert_selector "h1", text: "Quotes"
  # end
  setup do
    @quote = quotes(:first)
  end

  test "creating a Quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "New Quote"
    assert_selector "h1", text: "New Quote"

    fill_in "Name", with: "Capybara quote"
    click_on "Create Quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Capybara quote"
  end

  test "showing a Quote" do
    visit quotes_path
    click_on @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "updating a Quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"
    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit Quote"
    fill_in "Name", with: "Updated quote"
    click_on "Update Quote"
    assert_selector "h1", text: "Updated quote"
  end

  test "destroying a Quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"
    click_on "Delete", match: :first
    assert_no_text @quote.name
  end
end
