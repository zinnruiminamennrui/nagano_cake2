module ApplicationHelper

  # 税込の計算
  def tax_price(price)
    (price * 1.1).floor
  end

  #小計の計算
  def sub_price(sub)
    (tax_price(sub.product.price) * sub.quantity)
  end

  #合計の計算
  def total_price(totals)
    price = 0
    totals.each do |total|
      price += sub_price(total)
    end
    return price
  end

  def current_cart
    @cart_items = current_customer.cart_items
  end

  # 請求額の計算ヘルパー
  def billing(order)
    total_price(current_cart) + order.postage
  end

end
