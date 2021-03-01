class User < ApplicationRecord
  authenticates_with_sorcery!

  mount_uploader :avatar, AvatarUploader
  validates :name, presence: true
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true

  enum role: { general: 1, admin: 9 }

  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_games, through: :likes, source: :game

  def like?(game)
    like_games.include?(game)
  end

  def like(game)
    like_games << game
  end

  def unlike(game)
    like_games.delete(game)
  end
end
