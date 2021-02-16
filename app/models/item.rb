class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :fee
  belongs_to :area
  belongs_to :day

  with_options presence: true do
    validates :image
    validates :title
    validates :description
    validates :category_id
    validates :state_id
    validates :fee_id
    validates :area_id
    validates :day_id
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :fee_id
    validates :area_id
    validates :day_id
  end

  with_options numericality: { greater_than_or_equal_to: 300 } do
    validates :price
  end

  with_options numericality: { less_than_or_equal_to: 9_999_999 } do
    validates :price
  end

  with_options format: { with: /\A[0-9]+\z/ } do
    validates :price
  end
end
