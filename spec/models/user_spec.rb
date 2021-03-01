require 'rails_helper'

RSpec.describe User, type: :model do
  it "メールアドレスがユニークである事"
  it "名前がなければ無効である事" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end
end
