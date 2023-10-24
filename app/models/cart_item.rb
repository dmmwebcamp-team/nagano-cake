class CartItem < ApplicationRecord

  belongs_to :customer, foreign_key: :customer_id
  belongs_to :item, foreign_key: :item_id


  def subtotal
    item.price_with_tax * amount
  end

  validates :amount, presence: true

end
