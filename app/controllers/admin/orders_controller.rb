class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!


  def top
  end

  def index
    @orders = Order.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to oadmin_order_path(@order.id)
  end

private

  def order_params
      params.require(:order).permit(:user_id, :total_amount, :order_status, :method_of_payment, :postcode, :shipping_address, :shipping_name, :postage)
  end

end

