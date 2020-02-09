class Admin::ProductsController < ApplicationController

  def new
    @new_product = Product.new
    # 新規作成のためインスタンス変数を@new_に修正
  end

  def create
    @new_product = Product.new(product_params)
    # 1つのデータを対象にしているので@_product、単数形にしています。
    @new_product.save
    redirect_to admin_product_path
  end

  def index
  end

  def show
    @product = Product.find()
  end

  def edit
  end

  def update
  end
end