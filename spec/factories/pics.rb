# == Schema Information
#
# Table name: pics
#
#  id         :bigint(8)        not null, primary key
#  file       :string
#  item_id    :integer
#  item_type  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :pic do
    item { create :product }
    file { File.open(Rails.root.join('spec', 'fixtures', ['product_pic.jpg', 'product_pic1.jpg', 'product_pic2.jpg'].sample)) }
  end
end
