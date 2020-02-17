class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!


  def top
    @count = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).count

  end

  def all
    @orders_all = Order.page(params[:page])
  end

  def index

    @path = Rails.application.routes.recognize_path(request.referer)

    if @path[:action] == "top"
      @orders = Order.page(params[:page]).where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)

    elsif @path[:action] == "show"
      @customer = Customer.find(@path[:id])
      @orders = @customer.orders.page(params[:page])

    end


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

