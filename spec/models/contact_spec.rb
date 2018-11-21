require 'rails_helper'

RSpec.describe Contact, type: :model do
  context 'valid factory' do
    it 'has a valid factory' do
      expect(FactoryBot.build(:contact)).to be_valid
    end
  end
end
