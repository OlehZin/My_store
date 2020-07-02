# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord
  validates :price, numericality: {greater_than: 0, allow_nil: true}
  validates :name, :description,  presence: true

  has_and_belongs_to_many :orders
end
