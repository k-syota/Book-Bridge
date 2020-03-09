class Author < ApplicationRecord
  has_many :book dependent: :destroy #Bookとの関連付け
end
