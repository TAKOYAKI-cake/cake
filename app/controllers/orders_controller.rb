class OrdersController < ApplicationController


  def new
    @customer = current_customer
    @order = Order.new
  end

  def index
    @customer = current_customer
      @orders = Order.all
      #@total_amount = 0
      #@Orders.orderd_products.each do |product|
      # @total_amount += product.product_price
      #end
      #@orderd_product = OrderdProduct.all
      #@total_amount = @orderd_product.product_price.sum(:product_price)
  end

  def create
    @order = current_customer.orders.new(order_params)
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

    if @order.shipping_address == ""
      @order.shipping_address = @customer.address
    end

    @address = Address.all
    @order_postage = 800


    render :new unless @order.valid?

  end

  def show
    @customer = current_customer
    @order = Order.find(params[:id])
    @order_postage = 800
    @orderd_product = @order.orderd_products
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

  # def orderd_product_params
  #   params.require(:orderd_product).permit(:quantity, :price, :making_status, :order_id, :product_id)
  # end

end
