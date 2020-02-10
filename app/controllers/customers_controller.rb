class CustomersController < ApplicationController
  def top
  	@customer = current_customer
  end

  def show
    @customer = current_customer#customerのidを取得
  end

  def edit
    @customer = current_customer#customerのidを取得
  end
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path
  end

  def confirm
    @customer = current_customer
  end

  private
  def customer_params
    params.require(:customer).permit(:family_name,:last_name,:family_name_kana,:last_name_kana,:post_code,:post_code,:telephone_number)
  end
end