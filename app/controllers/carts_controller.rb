class CartsController < ApplicationController
  def index
  	@customer = current_customer#ヘッダー
  	@cart_items =CartItem.all#cart_itemsテーブルから全て取り出す
  end

  def show
  end

  def new
  end
#カートに商品を入れる
  def create
  	@cart = CartItem.new(cart_params)#新規投稿
    @cart.customer_id = current_customer.id
    @cart.save#保存
    redirect_to carts_path#カート内一覧
  end

private
    def cart_params
        params.require(:cart_item).permit(:user_id, :product_id, :quantity)
    end
end