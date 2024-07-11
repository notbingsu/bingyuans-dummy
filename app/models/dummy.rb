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
class Dummy < ApplicationRecord
  def addition
    a + b
  end
end
