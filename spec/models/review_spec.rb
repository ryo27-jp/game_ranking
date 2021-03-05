require 'rails_helper'

RSpec.describe Review, type: :model do

    it "本文があれば有効な事" do
      review = FactoryBot.build(:review)
      review.valid?
      expect(review).to be_valid
    end

    it "本文がなければ無効な事" do
      review = FactoryBot.build(:review, body:nil)
      review.valid?
      expect(review.errors[:body]).to include("can't be blank")
    end
end
