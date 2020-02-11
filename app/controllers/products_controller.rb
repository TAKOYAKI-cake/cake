class ProductsController < ApplicationController
  def index#一覧、ジャンル検索一覧
  	@customer = current_customer#ヘッダー
    @genres = Genre.all#ジャンルサイドバー一覧

    @products = Product.all#productテーブルから全て取り出す
    @count = Product.count#product内全件の数
    @title = "商品一覧"#genre_id(params)がない時の一覧タイトル

    @products = Product.page(params[:page]).reverse_order#kaminariページャ用のため、７、１１行目と同じ名前
  end

  def genre
    @customer = current_customer#ヘッダー
    @genres = Genre.all#ジャンルサイドバー一覧

    @genre = Genre.find(params[:genre_id])# Genreのデータベースのテーブルから一致するidを取得
    @products = @genre.products.all# genre_idと紐づく投稿を取得
    @count = @products.count#@productsは7行目、genre_idと紐づいたテーブル数
    @title = genre.name #genre_id(params)がある時の一覧タイトル

    @products = Product.page(params[:page]).reverse_order#kaminariページャ用のため、７、１１行目と同じ名前
  end

  def show#商品詳細,注文ボタン
    @customer = current_customer#ヘッダー
    @genres = Genre.all#ジャンルサイドバー一覧
    @product = Product.find(params[:id])#商品のレコードのid取得
  end

  def new
  end

  def edit
  end
end
