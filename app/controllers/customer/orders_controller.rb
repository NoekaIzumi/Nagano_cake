class Customer::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end


  def thanks

  end

  def confirm
    @order = current_customer.orders.new(order_params)
    @customer = current_customer
    @cart_items = current_customer.cart_items.all


    @order.postcode = @customer.postal_code
    @order.address = @customer.address
    @order.name = @customer.last_name + @customer.first_name
    @selected_payment_method = params[:order][:peyment_method]

    @sum = 0
    @shipping_fee = 800
    
      @cart_items.each do |cart_item|
        @sum += cart_item.item.with_tax_price * cart_item.amount
      end
      
    @total_amount = @sum + @shipping_fee
  end

  def create
    @cart_items.each do |cart_item|
    order_item = OrderItem.create!(
    order_id: @order.id,
    item_id: cart_item.item_id,
    price: cart_item.item.with_tax_price,
    quantity: cart_item.amount
  )
  end
  end

  def index

  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :total_amount, :shipping_fee, :payment_method, :address, :name, :postcode, )
  end

  def customer_params
    params.require(:order).permit(:address, :postal_code, :name )
  end




end
