class OrderItem < ApplicationRecord

  belongs_to :items, foreign_key: :item_id
  belongs_to :orders, foreign_key: :order_id

end
