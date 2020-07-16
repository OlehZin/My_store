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

class Order < ApplicationRecord
  has_and_belongs_to_many :products
  belongs_to :user
  
  # enum status: [:active, :completed]
  # scope :active, -> { where(status: "active") }
  # scope :completed, -> { where(status: "completed") }
  
  def finish
    self.total_price = self.products.sum(:price)
    # self.status = "completed"
    self.save
  end
end
