# == Schema Information
#
# Table name: dummies
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  a          :integer
#  b          :integer
#
FactoryBot.define do
  factory :dummy do
    a { 4 }
    b { 5 }
  end
end
