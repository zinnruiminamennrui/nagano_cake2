class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_products, dependent: :destroy
  enum payment_method: {
    credit_card:0,
    bank_transfer:1
  }

  enum status: {
    waiting:0,
    cofirmartion:1,
    in_prodouction:2,
    preparing:3,
    delivered:4
  }
end
