class ProductsController < ApplicationController
  def index#一覧、ジャンル検索一覧
  	@customer = current_customer#ヘッダー
    @genres = Genre.where(is_active: true)
#ジャンルサイドバー一覧

    @products = Product.where(sales_status: 0).page(params[:page]).reverse_order#productテーブルから全て取り出す,kaminari#productテーブルから有効なものを全て取り出す
    @count = Product.where(sales_status: 0).count#product内全件の数
    @title = "商品一覧"#genre_id(params)がない時の一覧タイトル

  end

  def genre
    @customer = current_customer#ヘッダー
    @genres =  Genre.where(is_active: true)#ジャンルサイドバー一覧

    @genre = Genre.find(params[:id])# Genreのデータベースのテーブルから一致するidを取得
    @products = @genre.products.where(sales_status: 0).page(params[:page]).reverse_order#productテーブルから全て取り出す,kaminari# genre_idと紐づく投稿を取得
    @count = @products.count#@productsは7行目、genre_idと紐づいたテーブル数
    @title = @genre.name #genre_id(params)がある時の一覧タイトル
  end

  def new
  end

  def show#商品詳細,注文ボタン
    @customer = current_customer#ヘッダー
    @genres = Genre.where(is_active: true)

    @product = Product.find(params[:id])#商品のレコードのid取得
    @carts = CartItem.new#新規投稿
  end

  def edit
  end
end