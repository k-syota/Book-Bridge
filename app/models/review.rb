class Review < ApplicationRecord
  #UserとBookの中間テーブル
  belongs_to :user
  belongs_to :book
end
