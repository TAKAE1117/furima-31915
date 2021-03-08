class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code,   format: { with: /\A\d{3}-\d{4}\z/, message: 'Postal code Input correctly' }
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'Phone number is invalid' }
    validates :token
    validates :user_id
    validates :item_id
  end

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address,
                   building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
