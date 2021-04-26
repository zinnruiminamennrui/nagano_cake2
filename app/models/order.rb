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

  def total_quantity
    sum = 0
    order_products.each do |order_product|
      sum += order_product.quantity
    end
    return sum
  end
end

