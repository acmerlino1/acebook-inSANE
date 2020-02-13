require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can view delete button" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"

    expect(page).to have_button("Delete")
  end

  scenario "Can delete post" do
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    click_button "Delete"
    # accept_alert {"Are you sure?"}
    # page.driver.browser.switch_to.alert.accept

    expect(page).not_to have_content("Hello, world!")
    expect(page).not_to have_content(Time.now.strftime("%Y-%m-%d %H:%M:%S").to_s)
  end


end