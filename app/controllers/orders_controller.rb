class OrdersController < ApplicationController

  def new
    @order = Order.new
  end
  
  def index
    @customer = current_customer
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_congfirm_path(@order.id)
  end

  def show
  end

  def edit
  end

  def thanks
    @customer = current_customer
  end
end
