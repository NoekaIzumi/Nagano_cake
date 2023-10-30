class Customer::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
		@customer = current_customer
		if @customer.update(customer_params)
		   redirect_to customer_customer_path(current_customer)
		else
			render :edit
		end
  end

	def new
	 @customer = Customer.new
	end

	def create
	 @customer = Customer.new(customer_params)
   if @customer.save
     byebug
     @customer = Customer.find_by_email
     sign_in @customer
   else
     render new
   end
	end


  def confirm_withdraw
    @customer = Customer.find(current_customer.id)
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:email)
  end

end
