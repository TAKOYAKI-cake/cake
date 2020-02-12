class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_congfirm_path(@order.id)
  def index
  end

  def show
  end

  def new
  end

  def edit
  end
end
