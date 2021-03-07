require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "testdesu" do
    FactoryBot.create(:user)
    visit games_path
    expect(page).to have_content "taro"
  end
end
