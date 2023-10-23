class Admin::OrdersController < ApplicationController

  def show
     @customer = Customer.find(params[:customer_id])
     @order = @customer.order
  end

  
end
