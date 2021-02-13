class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase

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

  with_options format: { with: greater_than_or_equal_to: 300 } do
    validates :price
  end

  with_options format: { with: less_than_or_equal_to: 9999999 } do
    validates :price
  end

  with_options format: { with: /\A[0-9]+\z/ } do
    validates :price
  end
end
