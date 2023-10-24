class Admin::OrdersController < ApplicationController

  def show
      @order = Order.find(params[:id])
      @order_items = @order.order_items

      @shipping_fee = 800
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :total_amount, :shipping_fee, :payment_method, :address, :name, :postcode)
  end

  def customer_params
    params.require(:order).permit(:address, :postal_code, :name )
  end




end
