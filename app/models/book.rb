class Book < ApplicationRecord
  validates :name, presence: true

  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy #マイリストとの関連付け
  has_many :reviews, dependent: :destroy #レビューとの関連付け
  accepts_nested_attributes_for :reviews
  # bookとreviewが関連づけられているので、[accepts_nested_attributes_for]を使いネストさせて
  # 一度にレコードの作成・更新を可能にする

  def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
      # 引数で渡されたuser_idがFavoritesテーブル内に存在（exists?）するかどうかを調べるメソッド
  end

  def in_book?
    Book.where(name: name).exists?
    # 引数で渡されたnameがBooksテーブル内に存在（exists?）するかどうかを調べるメソッド
  end

  acts_as_taggable
  acts_as_taggable_on :authors, :genres
  # tag_list/author_list/genre_listの３つを製作
end
