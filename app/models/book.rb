class Book < ApplicationRecord

  has_many :users # ユーザーとの関連付け
  has_many :favorites dependent: :destroy #マイリストとの関連付け
  has_many :reviews dependent: :destroy #レビューとの関連付け
  belongs_to :author #著者との関連付け

end
