class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!


  def top
  end

  def index
    @orders = Oder.all
  end

  def show
    @order = Order.find(params[:id])
  end

private

  def order_params
      params.require(:order).permit(:)
end
