require 'rails_helper'

RSpec.describe "Users", type: :system do
  it "test" do
    user = FactoryBot.create(:user)
    visit users_path
    expect(page).to have_content "taro"
  end
end
