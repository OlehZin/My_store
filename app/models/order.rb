class Order < ApplicationRecord
  has_and_belongs_to_many :products
  belongs_to :user

  scope :active, -> { where(status: "active") }
  
  def finish
    self.total_price = self.products.sum(:price)
    self.save
  end

  def change_status
    self.status = "completed"
  end

end
