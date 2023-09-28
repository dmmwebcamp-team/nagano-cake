class CartItem < ApplicationRecord

  belongs_to :customers, foreign_key: :customer_id
  belongs_to :items, foreign_key: :item_id

end
