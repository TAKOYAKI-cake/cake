class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!


  def top
    @order = Order.all
  end

  def index
    @customers = Customer.all
    @orders = Order.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @orderd_products = @order.orderd_products
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order.id)
  end

private

  def order_params
      params.require(:order).permit(:customer_id, :total_amount, :order_status, :method_of_payment, :postcode, :shipping_address, :shipping_name, :postage)
  end
  def set_zone
  Time.zone='Tokyo'
  end

end

