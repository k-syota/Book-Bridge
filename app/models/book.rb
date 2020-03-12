class Book < ApplicationRecord

  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy #マイリストとの関連付け
  has_many :reviews, dependent: :destroy #レビューとの関連付け
  belongs_to :author, optional: true#著者との関連付け

  acts_as_taggable
end
