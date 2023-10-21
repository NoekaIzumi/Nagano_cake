class Customer::CartItemsController < ApplicationController

  def index
     @customer = Customer.find(current_customer.id)
  end

end
