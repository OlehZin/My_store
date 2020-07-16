# == Schema Information
#
# Table name: orders
#
#  id          :bigint           not null, primary key
#  user_id     :bigint
#  total_price :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  status      :integer          default(0)
#

require 'rails_helper'

RSpec.describe Order, type: :model do
  let!(:product1) { create(:product, price: 100) }
  let!(:product2) { create(:product, price: 50) }
  let!(:order)    { create(:order, products: [product1, product2]) }
  describe "model tests" do
    it "have valid factory" do
      expect(create(:order)).to be_valid
    end

    it "finish work`s correct" do
      expect(order.total_price).to be_nil
      order.finish
      order.reload
      expect(order.total_price).to eq(150.0)
    end
  end
end
