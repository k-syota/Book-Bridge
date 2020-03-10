class Book < ApplicationRecord

  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy #マイリストとの関連付け
  has_many :reviews #レビューとの関連付け
  # accepts_nested_attributes_for :reviews
  belongs_to :author, optional: true#著者との関連付け
end
