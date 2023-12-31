class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8)
    @item_count = @items.count
  end

  def show
    @item =Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
