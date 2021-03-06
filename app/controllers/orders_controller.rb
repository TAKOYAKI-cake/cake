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
    @carts = current_customer.cart_items
    @order_postage = 800
    @sum = 0
      @carts.each do |c|
        price = c.product.price
        qty = c.quantity
        @sum +=  (price * 1.08) * qty
        #binding.pry
      end
    @total_amount = @sum + @order_postage
    #@total_amount =
    #binding.pry
    @order.attributes = {total_amount: @total_amount}
    @order.save
    @carts = current_customer.cart_items
      @carts.each do |c|
      orderd_product = OrderdProduct.new
      # orderd_productに必要なカラムを入れる
        orderd_product.product_id = c.product_id
        orderd_product.quantity = c.quantity
        orderd_product.price = c.product.price
        orderd_product.order_id = @order.id
        orderd_product.save!
      end
    @carts.destroy_all
    # binding.pry

    redirect_to orders_thanks_path

  end

  def confirm_new

    @customer = current_customer
    @order = @customer.orders.new(order_params)
    @carts = current_customer.cart_items

    @address = Address.new(
      customer_id: current_customer.id,
      post_code: params[:order][:address][:post_code],
      shipping_address: params[:order][:address][:shipping_address],
      shipping_name: params[:order][:address][:shipping_name]
    )

    if params[:select_shipping_address] == "1"
     @order.shipping_address = @customer.address
     @order.postcode = @customer.post_code
     @order.shipping_name = @customer.total_name
   elsif params[:select_shipping_address] == "2"
     @order.shipping_address = params[:order][:shipping_address]
     @select = Address.find_by(shipping_address: params[:order][:shipping_address])
     if @select
      @order.postcode = @select[:post_code]
      @order.shipping_name = @select[:shipping_name]
    else
      flash[:notice] = "届け先を選択してください"
      render :new
     end
   elsif params[:select_shipping_address] == "3"
     @order.shipping_address = @address.shipping_address
     @order.postcode = @address.post_code
     @order.shipping_name = @address.shipping_name
     @address.save
     render :new unless @address.valid?
   end


   @order_postage = 800
   # binding.pry
   end

  def show
    @customer = current_customer
    @order = Order.find(params[:id])
    @order_postage = 800
    @orderd_products = @order.orderd_products
    @item = OrderdProduct.all
    #@orderd_product = OrderdProduct.sum(:price)
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

  # def orderd_product_params
  #   params.require(:orderd_product).permit(:quantity, :price, :making_status, :order_id, :product_id)
  # end

end
