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
