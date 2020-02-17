class CartsController < ApplicationController
before_action :authenticate_customer!, only: [:index, :update, :destroy, :destroy_all]#ログインしていない人をログイン画面へ
  def index
  	@customer = current_customer#ヘッダー
  	@cart_items =CartItem.all#cart_itemsテーブルから全て取り出す
  end

  def update
    cart_item = CartItem.find(params[:id])

    cart_item.update(cart_params)
    redirect_to carts_path#カート内一覧
  end
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy#データ（レコード）を削除
    redirect_to carts_path#カート内一覧
  end
  def destroy_all#ルーティング追加予定
    #本来はモデル.find().アソシエーションだけど
    #ログインしてる人のidが欲しいので、deviceで自動定義してくれるcurrent_customerを使う、customerに紐づくカーとを消す処理
    current_customer.cart_items.destroy_all
    redirect_to carts_path#カート内一覧
  end

  def show
  end

  def new
  end
#カートに商品を入れる
  def create
    @product = Product.find(params[:cart_item][:product_id] )

    if current_customer != nil
      if @product.in_cart?(current_customer)
         @cart_item = current_customer.cart_items.find_by(product_id: @product.id)
         @cart_item.quantity += params[:cart_item][:quantity].to_i
         @cart_item.save

      else
  	   @cart = CartItem.new(cart_params)#新規投稿
       @cart.customer_id = current_customer.id
       @cart.save#保存

     end
       redirect_to carts_path#カート内一覧

    else
     flash[:notice] = "ログインをして下さい"#ログインを促す
     redirect_to customer_session_path#カスタマーのsign_in画面へ

     end
  end

private
    def cart_params
        params.require(:cart_item).permit(:customer_id, :product_id, :quantity)
    end
end