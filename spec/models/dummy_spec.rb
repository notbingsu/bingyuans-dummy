require 'rails_helper'

RSpec.describe Dummy, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  context 'addition' do
    it 'adds two numbers' do
      expect(Dummy.addition(1, 2)).to eq 3
    end
  end
end
