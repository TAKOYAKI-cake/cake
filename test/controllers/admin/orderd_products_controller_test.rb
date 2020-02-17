require 'test_helper'

class Admin::OrderdProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admin_orderd_products_update_url
    assert_response :success
  end

end
