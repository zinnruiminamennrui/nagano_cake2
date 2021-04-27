class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_products, dependent: :destroy
  enum payment_method: {
    credit_card:0,
    bank_transfer:1
  }

  enum status: {
    入金待ち:0,
    入金確認:1,
    製作中:2,
    発送準備中:3,
    発送済み:4
  }

  def total_quantity
    sum = 0
    order_products.each do |order_product|
      sum += order_product.quantity
    end
    return sum
  end
end

