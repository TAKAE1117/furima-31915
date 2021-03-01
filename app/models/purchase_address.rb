class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code,   format: { with: /\A\d{3}[-]\d{4}\z/, message: "Postal code Input correctly" }
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :phone_number
  end

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end
  
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end