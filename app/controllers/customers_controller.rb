class CustomersController < ApplicationController
  def top
  	@customer = current_customer
  end

  def show
    @customer = current_customer
  end

  def edit

  end

  def confirm
  end

  private
  def customer_params
    params.require(:user).permit(:family_name,:last_name,:family_name_kana,:last_name_kana,:post_code,:post_code,:telephone_number)
  end
end