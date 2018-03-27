require "rails_helper"

feature "ログインとログアウト" do
  background do
    User.create!(email: "foo@example.com", password: "foobar")
  end

  scenario "ログイン" do
    visit root_path
    fill_in "Eメール", with: "foo@example.com"
    fill_in "パスワード", with: "foobar"
    click_on "ログイン"

    expect(page).to have_content "ログインしました"
  end

  scenario "ログアウト" do
    visit root_path
    fill_in "Eメール", with: "foo@example.com"
    fill_in "パスワード", with: "foobar"
    click_on "ログイン"

    click_link "Logout"
    # save_and_open_page

    expect(page).to have_button "ログイン"
  end
end
