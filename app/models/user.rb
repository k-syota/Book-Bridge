class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   has_many :books dependent: :destroy #bookとの関連付け
   has_many :favorites dependent: :destroy #マイリストとの関連付け
   has_many :reviews dependent: :destroy #レビューとの関連付け
end
