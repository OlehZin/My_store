require 'rails_helper'

RSpec.describe "Products", type: :request do
  let!(:user) { create(:user) }
  let!(:cart) { create(:cart, user: user) }

  before(:each) do
    sign_in user
  end

  describe "index page" do
    it "work`s correct" do
      get products_path
      expect(response).to be_successful
    end
  end

  describe "show page" do
    let!(:product) { create(:product) }
    it "work`s correct" do
      get product_path(product)
      expect(response).to be_successful
    end
  end

  describe "add to cart" do
    let!(:product) { create(:product) }
    it "work`s correct" do
      expect(user.cart.products.count).to eq(0)
      post add_to_cart_product_path(product.id)
      expect(user.cart.products.count).to eq(1)
      expect(response).to redirect_to(products_path)
      follow_redirect!
      expect(response.body).to include(product.name)
    end

    it "work`s incorrect" do
      expect(user.cart.products.count).to eq(0)
      post add_to_cart_product_path("123124")
      expect(user.cart.products.count).to eq(0)
      expect(response).to redirect_to(products_path) 
    end
  end
end
