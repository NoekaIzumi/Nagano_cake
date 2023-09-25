class Public::CustomersController < ApplicationController
  
  before_action :authenticate_customer!, only: [:show, :edit]

  def show
    @customer = current_customer
  end

  def edit
    @user = current_user
  end

  def update

  end

  def confirm_withdraw

  end

  def withdraw

  end

  private

  def customer_params
    params.require(:customer).permit(:email)
  end

end
