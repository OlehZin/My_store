# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  name                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :integer          default("user")
#

FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    password {'12345678'}
    password_confirmation {'12345678'} 
  end
  factory :admin, parent: :user do
    role {"admin"}
  end
end
