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
require 'rails_helper'

RSpec.describe Dummy, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  context 'addition' do
    it 'adds two numbers' do
      dummy = build(:dummy, a: 4, b: 5)
      expect(dummy.addition).to eq(9)
    end
  end
end
