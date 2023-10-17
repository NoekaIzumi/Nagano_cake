class Admin::CustomersController < ApplicationController

  def index
   @customers=Customer.page(params[:page])
  end

  def show
   @customer=Customer.find(params[:id])
  end

  def edit

  end

  def update

  end

private

def customer_params
   params.require(:customer).permit(:first_name, :last_name, :email,:is_deleted)
end


end
