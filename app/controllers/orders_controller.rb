class OrdersController < ApplicationController

  def new
    @customer = current_customer
    @order = Order.new
    @address = Address.new
    @order.orderd_products.build
  end

  def index
    @customer = current_customer
    @orders = Order.all
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    @address = current_customer.addresses.new
    @address.shipping_address = @order.shipping_address
    @address.post_code = @order.postcode
    @address.shipping_name = @order.shipping_name

    @address.save


    redirect_to orders_path
  end

  def confirm_new

    @customer = current_customer
    @order = @customer.orders.new(order_params)
    @carts = CartItem.all
    @address = params[:order][:address]

    if params[:select_shipping_address] == "1"
     @order.shipping_address = @customer.address
     @order.postcode = @customer.post_code
     @order.shipping_name = @customer.total_name

   elsif
     params[:select_shipping_address] == "2"
     @order.shipping_address = params[:order][:shipping_address]
     @select = Address.find_by(shipping_address: params[:order][:shipping_address])
     @order.postcode = @select[:post_code]
     @order.shipping_name = @select[:shipping_name]
   else
     params[:select_shipping_address] == "3"
     @order.shipping_address = @address[:shipping_address]
     @order.postcode = @address[:post_code]
     @order.shipping_name = @address[:shipping_name]

   end

   render :new unless @order.valid?

 end

 def show
  @customer = current_customer
  @order = Order.find(params[:id])
end

def edit
end

def thanks
  @customer = current_customer
end

private

def order_params
  params.require(:order).permit(:user_id, :total_amount, :order_status, :method_of_payment, :postcode, :shipping_address, :shipping_name, :postage, orderd_products_attributes: [:price])
end

def address_params
  params.require(:address).permit(:customer_id, :post_code, :shipping_address, :shipping_name)
end

end
