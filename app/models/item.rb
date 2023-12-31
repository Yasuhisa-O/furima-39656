class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :name        , presence: true
  validates :description , presence: true
  validates :price       , presence: true ,numericality: {only_integer: true, greater_than: 299, less_than: 10000000}
  validates :image       , presence: true

  validates :category_id        , numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id       , numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id , numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id      , numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_time_id   , numericality: { other_than: 1 , message: "can't be blank"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shipping_time

end
