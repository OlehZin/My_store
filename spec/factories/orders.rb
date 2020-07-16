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

FactoryBot.define do
  factory :order do
    user
  end
end
