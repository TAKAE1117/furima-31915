class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :password, length: { minimum: 6}
    validates :nickname
    validates :last_name_kanji
    validates :first_name_kanji
    validates :last_name_kana 
    validates :first_name_kana
    validates :birthday
  end

  with_options format: { with: /\A[a-zA-Z0-9]+\z/ } do
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