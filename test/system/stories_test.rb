require "application_system_test_case"

class StoriesTest < ApplicationSystemTestCase
  setup do
    @story = stories(:one)
  end

  test "visiting the index" do
    visit stories_url
    assert_selector "h1", text: "Stories"
  end

  test "creating a Story" do
    visit stories_url
    click_on "New Story"

    fill_in "Accepted at", with: @story.accepted_at
    fill_in "Ban reason", with: @story.ban_reason
    check "Banned" if @story.banned
    fill_in "Banned at", with: @story.banned_at
    fill_in "Category", with: @story.category_id
    fill_in "Content", with: @story.content
    fill_in "Contest", with: @story.contest_id
    check "Deleted" if @story.deleted
    fill_in "Intro", with: @story.intro
    fill_in "Like", with: @story.like
    fill_in "Status", with: @story.status
    fill_in "Title", with: @story.title
    fill_in "User", with: @story.user_id
    click_on "Create Story"

    assert_text "Story was successfully created"
    click_on "Back"
  end

  test "updating a Story" do
    visit stories_url
    click_on "Edit", match: :first

    fill_in "Accepted at", with: @story.accepted_at
    fill_in "Ban reason", with: @story.ban_reason
    check "Banned" if @story.banned
    fill_in "Banned at", with: @story.banned_at
    fill_in "Category", with: @story.category_id
    fill_in "Content", with: @story.content
    fill_in "Contest", with: @story.contest_id
    check "Deleted" if @story.deleted
    fill_in "Intro", with: @story.intro
    fill_in "Like", with: @story.like
    fill_in "Status", with: @story.status
    fill_in "Title", with: @story.title
    fill_in "User", with: @story.user_id
    click_on "Update Story"

    assert_text "Story was successfully updated"
    click_on "Back"
  end

  test "destroying a Story" do
    visit stories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Story was successfully destroyed"
  end
end
