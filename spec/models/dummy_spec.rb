require 'rails_helper'

RSpec.describe Dummy, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  context 'addition' do
    it 'adds two numbers' do
      dummy = build(:dummy, a: 4, b: 3)
      expect(dummy.addition).to eq(9)
    end
  end
end
