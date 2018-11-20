require 'rails_helper'

RSpec.describe Group, type: :model do
  context 'valid factory' do
    it 'has a valid factory' do
      expect(FactoryBot.build(:group)).to be_valid
    end
  end
end
