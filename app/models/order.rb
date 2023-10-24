class Order < ApplicationRecord

  has_many :order_items, dependent: :destroy
  belongs_to :customer, foreign_key: :customer_id

  enum payment_method: { credit_card: 1, transfer: 2 }

  def postage
    self.postage = 800
  end

end
