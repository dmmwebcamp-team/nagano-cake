class Order < ApplicationRecord

  has_many :order_items, dependent: :destroy
  belongs_to :customer, foreign_key: :customer_id

end
