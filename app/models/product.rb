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

class Product < ApplicationRecord
  has_many :pics, as: :item, dependent: :destroy
  accepts_nested_attributes_for :pics, allow_destroy: true, reject_if: :all_blank
end
