class Book < ApplicationRecord
  validates :name, presence: true

  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy #マイリストとの関連付け
  has_many :reviews, dependent: :destroy #レビューとの関連付け

    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end

  acts_as_taggable
  acts_as_taggable_on :authors, :genres
end
