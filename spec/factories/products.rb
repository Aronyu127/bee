# == Schema Information
#
# Table name: products
#
#  id          :bigint(8)        not null, primary key
#  name        :string           not null
#  description :text
#  price       :integer          not null
#  vip_price   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :product do
    name 'test product'
    description 'prdouct description'
    price 150
    vip_price 140
  end
end
