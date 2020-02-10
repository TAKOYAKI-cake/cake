class ProductsController < ApplicationController
  def index
  	@customer = current_customer#ヘッダー
#サイドジャンル検索ようのが必要
    @products = Product.all#productテーブルから全て取り出す
    @products = Product.page(params[:page]).reverse_order#kaminariページャ用のため
  end

  def show#商品詳細,注文ボタン
  end

  def new
  end

  def edit
  end
end
