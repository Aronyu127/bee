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

class Pic < ApplicationRecord
  belongs_to :item, polymorphic: true
  mount_uploader :file, PicUploader
end
