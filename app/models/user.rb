class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :items
  has_many :purchases

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :password, length: { minimum: 6 }
    validates :nickname
    validates :last_name_kanji
    validates :first_name_kanji
    validates :last_name_kana
    validates :first_name_kana
    validates :birthday
  end

  with_options format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/ } do
    validates :password
  end

  with_options format: { with: /\A[ぁ-んァ-ン一-龥々]/ } do
    validates :last_name_kanji
    validates :first_name_kanji
  end

  with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :last_name_kana
    validates :first_name_kana
  end
end
