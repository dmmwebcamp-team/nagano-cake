class Public::CartItemsController < ApplicationController
  def show
  end

  def create
    @cart_item = CartItem.new
    @cart_item.save
    redirect_to cart_items_path
  end
end
