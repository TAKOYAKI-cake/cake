class Admin::OrderdProductsController < ApplicationController
  def update
  	@orderd_product = OrderdProduct.find(params[:id])
  	@orderd_product.update(orderd_product_params)
  	#binding.pry
  	@order = @orderd_product.order
    if @orderd_product.making_status == "製作中"
      @order.update(order_status: 2)
    redirect_to admin_order_path(@order.id)
    end
    if @order.orderd_products.all? {|a| a.making_status == "製作完了"}
      @order.update(order_status: 3)
    end
    redirect_to admin_order_path(@order.id)
  end
  private
  def orderd_product_params
  	params.require(:orderd_product).permit(:quantity, :price, :making_status, :order_id, :product_id)
  end
end
