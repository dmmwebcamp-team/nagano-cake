class OrderItem < ApplicationRecord

  belongs_to :item, foreign_key: :item_id
  belongs_to :order, foreign_key: :order_id

  def subtotal
    item.price_with_tax * purchase_amount
  end

end
