class OrdersController < ApplicationController


  def new
    @order = Order.new
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    redirect_to orders_path
  end

  def confirm_new
    @customer = current_customer
    @order = @customer.orders.new(order_params)

    if @order.shipping_address == ""
      @order.shipping_address = @customer.address
    end

    @address = Address.all

    render :new unless @order.valid?

  end

  def index

  end

  def show
  end

  def edit
  end

  private
  def order_params
    params.require(:order).permit(:user_id, :total_amount, :order_status, :method_of_payment, :postcode, :shipping_address, :shipping_name, :postage)
  end

end
