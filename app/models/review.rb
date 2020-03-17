class Review < ApplicationRecord

  validates :title, presence: true
  validates :text, presence: true

  #UserとBookの中間テーブル
  belongs_to :user, optional: true
  belongs_to :book
end
