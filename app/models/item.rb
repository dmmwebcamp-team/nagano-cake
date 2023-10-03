class Item < ApplicationRecord

  has_one_attached :image

  def price_with_tax
    (self.price * 0.1) + self.price
  end

  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  

end
