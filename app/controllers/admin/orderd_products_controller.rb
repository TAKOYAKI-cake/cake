class Admin::OrderdProductsController < ApplicationController
  def update
  	@orderd_product = OrderdProduct.find(params[:id])
  	@orderd_product.update(orderd_product_params)
  	#binding.pry
  	@order = @orderd_product.order
    redirect_to admin_order_path(@order.id)
  end
  private
  def orderd_product_params
  	params.require(:orderd_product).permit(:quantity, :price, :making_status, :order_id, :product_id)
  end
end
