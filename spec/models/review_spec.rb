require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
     @user =  User.create(
        name: "taro",
        email: "test@example.com",
        password: "pass",
        password_confirmation: "pass",
      )

      @game = Game.create(
        title: "title",
        description: "aaaa",
        release_date: "2019-08-01",
        production: "制作会社"
      )
  end

    it "本文があれば有効な事" do
      review = Review.new(
        body: "おk",
        user: @user,
        game: @game,
      )
      review.valid?
      expect(review).to be_valid
    end

    it "本文がなければ無効な事" do
      review = Review.new(body:nil)
      review.valid?
      expect(review.errors[:body]).to include("can't be blank")
    end
  
  context "" do
  end
end
