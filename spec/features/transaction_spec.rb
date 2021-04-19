require 'rails_helper'

RSpec.feature "Transactions", type: :feature do
  let(:user) { User.new(name: 'abdul12', id: 1) }
  let(:group) { Group.new(id: 1, name: 'abdul12', Icon: 'fa fa-500px', user_id: user.id) }
  let(:transaction) { Transaction.new(id: 1, name: 'abdulkhaliq', amount: 12, group_id: group.id, user_id: user.id) }

  def login_user(user)
    visit '/login'
    fill_in 'name', with: user.name
    click_button 'LogIn'
  end

  def fill_group_form(group)
    visit new_group_path
    fill_in 'Name', with: group.name
    choose(option: 'fa fa-500px')
    click_button 'Create Group'
  end

  def fill_transaction_form(transaction)
    visit new_transaction_path
    fill_in 'Name', with: transaction.name
    fill_in 'Amount', with: transaction.amount
    find(:select).find(:option, group.name).select_option
    # choose(option: group.name)
    click_button 'Create Transaction'
  end

  context 'User can Create new Group' do
    scenario 'new Group' do
      user.save
      login_user(user)
      fill_group_form(group)
      fill_transaction_form(transaction)
      expect(page).to have_content 'abdulkhaliq Transaction successfully created'
    end
  end
end
