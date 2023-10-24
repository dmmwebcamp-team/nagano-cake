class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @cart_items = CartItem.all
    @total_price = @cart_items.sum{ |cart_item| cart_item.subtotal.to_i }
  end

  def create
    @cart_item = current_customer.cart_items.find_by(item_id: cart_item_params[:item_id])

    if @cart_item
      @cart_item.amount += cart_item_params[:amount].to_i
    else
      @cart_item =CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
    end

    if @cart_item.save
      redirect_to cart_items_path
    else
      item = Item.find(cart_item_params[:item_id])
      redirect_to item_path(item.id), flash: { error: @cart_item.errors.full_messages }
    end
  end

  def update
    @cart_item =CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end



  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
