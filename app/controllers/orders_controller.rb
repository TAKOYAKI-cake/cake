class OrdersController < ApplicationController


  def new
    @order = Order.new
  end
  
  def index
    @customer = current_customer
    @orders = Order.all
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    redirect_to orders_path
  end

  def confirm_new
    @customer = current_customer
    @order = current_customer.orders.new(order_params)
    render :new unless @order.valid?
    if params[:shipping_address] == ""
      shipping_address = current_customer.shipping_address
    else
      shipping_address = params[:shipping_address]
    end
  end

  def show
    @customer = current_customer
  end

  def edit
  end

  def thanks
    @customer = current_customer
  end

  private
  def order_params
    params.require(:order).permit(:user_id, :total_amount, :order_status, :method_of_payment, :postcode, :shipping_address, :shipping_name, :postage)
  end

end

