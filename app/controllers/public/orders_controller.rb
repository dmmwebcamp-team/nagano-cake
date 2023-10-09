class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def index
    @orders = Order.all
  end

  def show
  end

  def confirm
    @order = Order.new(order_params)
    @order.attention_postal_code = current_customer.postal_code
    @order.attention_address = current_customer.address
    @order.delivery_name = current_customer.first_name + current_customer.last_name

    @cart_items = current_customer.cart_items
    @order_items = []

    @cart_items.each do |cart_item|
      order_item = OrderItem.new(
        item_id: cart_item.item.id,
        purchase_price: cart_item.item.price_with_tax.to_i,
        purchase_amount: cart_item.amount
        )
        @order_items << order_item
      end

      @order.order_items = @order_items
      @total_price = @order_items.sum{ |order_item| order_item.subtotal.to_i }
      @order.payment = @order.postage + @total_price
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items
    @order_items = []

    @cart_items.each do |cart_item|
      order_item = OrderItem.new(
        item_id: cart_item.item.id,
        purchase_price: cart_item.item.price_with_tax.to_i,
        purchase_amount: cart_item.amount
        )
        @order_items << order_item
      end

      @order.order_items = @order_items
    @order_items.each { |order_item| order_item.order_id = @order.id; order_item.save }
    @cart_items.destroy_all
    redirect_to orders_complete_path
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :attention_postal_code, :attention_address, :delivery_name, :postage, :payment)
  end
end
