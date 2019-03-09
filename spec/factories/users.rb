# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  admin                  :boolean          default(FALSE), not null
#  vip_expired_at         :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

FactoryBot.define do
  factory :user do
    sequence(:email) { |num| "#{num}@example.com" }
    password '11111111'

    trait :admin do
      admin true
    end

    trait :vip do
      vip_expired_at Time.current + 3.months
    end
  end
end
