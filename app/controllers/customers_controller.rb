class CustomersController < ApplicationController
  def top
    @customer = current_customer#ヘッダー
    @genres = Genre.all#ジャンルサイドバー一覧

    @products = Product.all#productテーブルから全て取り出す
    @count = Product.count#product内全件の数
    @title = "商品一覧"#genre_id(params)がない時の一覧タイトル

    @products = Product.page(params[:page]).reverse_order#kaminariページャ用のため同じ名前
  end

  def show
    @customer = current_customer#customerのidを取得
  end

  def edit
    @customer = current_customer#customerのidを取得
  end
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path
  end

  def confirm
    @customer = current_customer
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def logout
    session[:customer_id] = nil
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:family_name,:last_name,:family_name_kana,:last_name_kana,:post_code,:post_code,:telephone_number,:is_deleted)
  end
end