class Public::CustomersController < ApplicationController

  def show
    @customer= Customer.find(params[:id])
    @customer = current_customer
  end


  private

  def customer_params
    params.require(:customer).permit(:email)
  end

end
