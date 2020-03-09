class Favorite < ApplicationRecord
    #UserとBookの中間テーブル
  belonds_to :user
  belonds_to :book
end
