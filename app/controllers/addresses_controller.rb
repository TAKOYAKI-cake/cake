class AddressesController < ApplicationController
before_action :authenticate_customer!#ログインしていない人をログイン画面へ
  def create
  	address = Address.new(address_params)#真祈投稿用空
  	address.customer_id = current_customer.id#user_idは、コメントしたユーザのID、currentでログインしているユーザー
    address.save! #DBへ保存（保存できているか確認のため！つけてます）
    redirect_to "/addresses"# 配送先一覧・登録へリダイレクト
  end

  def index
  	@address = Address.new #新規登録用
  	@addresses = Address.all #一覧
  	@customer = current_customer#ヘッダー
  end

  def edit
  	@address = Address.find(params[:id])#編集更新するレコードのidを取得
  	@customer = current_customer#ヘッダー
  	@customer = current_customer #ヘッダー
  end

  def update
  	@address = Address.find(params[:id])#更新するレコードのidを取得
  	@address.update(address_params)# ストロングパラメーター
  	redirect_to addresses_path(@address.id)# 配送先一覧・登録へリダイレクト
  end

  def destroy
  	@address = Address.find(params[:id])#削除するレコードのidを取得
    @address.destroy#削除
    redirect_to addresses_path# 配送先一覧・登録へリダイレクト
  end

private

  def address_params#create,update用ストロングパラメーター
  	params.require(:address).permit(:post_code, :shipping_address, :shipping_name)
  end

end

