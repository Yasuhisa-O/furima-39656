class DonationAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :tel_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :address
    validates :tel_number, format: {with: /\A[0-9]{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    orders = Order.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, city: city, address: address, building_name: building_name, tel_number: tel_number, order_id: order.id)
  end

end