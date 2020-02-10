class Admin::ProductsController < ApplicationController

  def new
    @new_product = Product.new
    # 新規作成のためインスタンス変数を@new_に修正
  end

  def create
    @new_product = Product.new(product_params)
    # 1つのデータを対象にしているのでインスタンス変数を単数形にしています。
    @new_product.save!
    redirect_to admin_product_path(@new_product.id)
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
  def product_params
  params.require(:product).permit(:name, :description, :image_id, :sales_status, :price)
  end
end