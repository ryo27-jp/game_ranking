require 'rails_helper'

RSpec.describe User, type: :model do
  it "メールアドレスがユニークである事" do 
    FactoryBot.create(:user, email: "test@example.com")
    user = FactoryBot.build(:user, email: "test@example.com")

    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "名前がなければ無効である事" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "passwordが3文字以上である事" do
    user = FactoryBot.build(:user,
      password: "pa",
      password_confirmation: "pa",
    )  
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 3 characters)")
  end
end
