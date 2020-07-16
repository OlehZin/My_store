require 'rails_helper'

RSpec.describe "Account::Products", type: :request do
  let!(:admin) {create(:admin)}
  let!(:product) {create(:product)}
  before(:each) do
      sign_in admin
  end
    
  it "get index" do
    get '/account/products'
    expect(response).to be_successful
  end

  it "get show" do
    get product_path(product)
  expect(response).to be_successful
  end

  it "creates a product" do
    get '/account/products/new'
    expect(response).to render_template(:new)

    post "/account/products", :params => { :product => {name: "My name", description: "some text", price: "10" } }
    expect(response).to redirect_to account_products_path
    follow_redirect!
    expect(response).to render_template(:index)
  end

  it "does not render a different template" do
    get '/account/products'
    expect(response).to_not render_template(:show)
  end

  it "updates a product" do
    get edit_account_product_path(product)
    expect(response).to render_template(:edit)
    put account_product_path(product), :params => { :product => {name: "My name", description: "some text", price: "10" } }
    expect(response).to redirect_to action: "show"
    follow_redirect!
    expect(response).to render_template(:show)
  end

  it "deletes a product" do
    get '/account/products'
    delete account_product_path(product)
    expect(response).to redirect_to action: "index"
    follow_redirect!
    expect(response).to render_template(:index)
  end
  # invalid:
  it "doesn't creates a product" do
    get '/account/products/new'
    expect(response).to render_template(:new)
    post "/account/products", :params => { :product => {name: "", description: "", price: "-10" } }
    expect(response).to render_template(:new)
  end

  it "doesn't updates a product" do
    get edit_account_product_path(product)
    expect(response).to render_template(:edit)
    put account_product_path(product), :params => { :product => {name: "", description: "", price: "-10" } }
    expect(response).to render_template(:edit)
  end
end

