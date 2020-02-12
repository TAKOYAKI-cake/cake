class OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_congfirm_path(@order.id)
  end

  def index

  end

  def show
  end

  def edit
  end

end
