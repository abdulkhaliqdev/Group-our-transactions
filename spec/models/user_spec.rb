require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Abdul') }
  context 'validation of user' do
    it 'validates if name is present' do
      expect(subject).to be_valid
    end
    it 'rejects if name not present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
  context 'User Associations' do
    it 'It has create many Group' do
      should have_many(:groups)
    end
    it 'It has many Transaction' do
      should have_many(:transactions)
    end
  end
end
