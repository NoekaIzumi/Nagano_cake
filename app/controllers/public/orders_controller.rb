class Public::OrdersController < ApplicationController

  def new

  end

  def thanks

  end

  def confirm

  end

  def create

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

end
