require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'abdul khaliq', id: 1) }
  subject do
    Group.new(name: 'Ruby on rails', Icon: 'fa fa-cubes', user_id: user.id)
  end
  context 'validation of Group' do
    it 'group is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'rejects if title not present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'rejects if Icon not present' do
      subject.Icon = nil
      expect(subject).to_not be_valid
    end
    it 'rejects if user not present' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end
  end
  context 'Group Associations' do
    it 'It belongs to User' do
      should belong_to(:user)
    end
    it 'It has many Transaction' do
      should have_many(:transactions)
    end
  end
end
