class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!, only: [:show, :edit]

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
		@customer = current_customer
		if @customer.update(customer_params)
		   redirect_to customers_current_customer_path
		else
			render :edit
		end

  end

  def confirm_withdraw

    @customer =current_customer
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @custimer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def withdraw

  end

  private

  def customer_params
    params.require(:customer).permit(:email)
  end

end
