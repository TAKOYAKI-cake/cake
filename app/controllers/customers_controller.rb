class CustomersController < ApplicationController
  def top
  	@customers = current_customer
  end

  def show
  	@customers = Customer.find(params[:id])
  end

  def edit

  end

  def confirm
  end
end
