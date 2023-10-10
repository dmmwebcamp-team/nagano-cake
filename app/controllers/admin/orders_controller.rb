class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @customer_id = @order.customer_id
    @order_items = @order.order_items.all
    @total_price = @order_items.sum{ |order_item| order_item.subtotal.to_i }
  end
end
