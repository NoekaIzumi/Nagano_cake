class Customer::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
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

    order = Order.new(order_params)
    order.save
    @cart_items = current_customer.cart_items.all

    @cart_items.each do |cart_item|
      @order_items = OrderItem.new
      @order_items.order_id = order.id
      @order_items.item_id = cart_item.item.id
      @order_items.price = cart_item.item.with_tax_price
      @order_items.quantity = cart_item.amount

      @order_items.save!
    end
    CartItem.destroy_all
    redirect_to customers_orders_thanks_path
  end

  def thanks
    @customer = current_customer
  end

  def index
    @customer = current_customer
    @orders = current_customer.orders.all
    @order_items = OrderItem.where(order_id: @orders.pluck(:id))
  end

  def show
  @customer = current_customer
  @order = Order.find(params[:id])
  @order_items = @order.order_items
  @sum = 0
  @shipping_fee = 800
  @order_items.each do |order_item|
    @sum += order_item.price * order_item.quantity
  end
  @total_amount = @sum + @shipping_fee
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :total_amount, :shipping_fee, :payment_method, :address, :name, :postcode)

  end

  def customer_params
    params.require(:order).permit(:address, :postal_code, :name )
  end
  
  def order_item_params
  params.require(:order_item).permit(:item_id, :order_id, :price,:quantity)
  end



end
