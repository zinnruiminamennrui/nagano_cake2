class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  enum making_status: {
    not_possible:0,
    pending:1,
    in_prodouction:2,
    complete:3
  }
end
