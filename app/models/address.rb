class Address < ApplicationRecord

  belongs_to :prefecture
  belongs_to :order

  validates :postal_code   , presence: true
  validates :city          , presence: true
  validates :address       , presence: true
  validates :tel_number    , presence: true

  validates :prefecture_id , numericality: { other_than: 1 , message: "can't be blank"}

end
