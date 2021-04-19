require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:user) { User.create(name: 'abdul khaliq', id: 1) }
  let(:groups) { Group.create(id: 1, name: 'Ruby on rails', Icon: 'fa fa-cubes', user_id: user.id) }
  subject do
    Transaction.new(id: 1, name: 'Ruby on rails', amount: 23, group_id: groups.id, user_id: user.id)
  end

  context 'validation of Transaction' do
    it 'group is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'rejects if title not present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'rejects if amount not present' do
      subject.amount = nil
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
    it 'It has many Group' do
      should have_many(:group)
    end
  end
end
