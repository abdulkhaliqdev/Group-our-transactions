require 'rails_helper'

RSpec.feature 'Groups', type: :feature do
  let(:user) { User.new(name: 'abdul12', id: 1) }
  let(:group) { Group.new(name: 'abdul12', Icon: 'fa fa-cubes', user_id: user.id) }

  def login_user(user)
    visit '/login'
    fill_in 'name', with: user.name
    click_button 'LogIn'
  end

  def fill_group_form(group)
    visit new_group_path
    fill_in 'Name', with: group.name
    choose(option: 'fa fa-cubes')
    click_button 'Create Group'
  end

  context 'User can Create new Group' do
    scenario 'new Group' do
      user.save
      login_user(user)
      fill_group_form(group)
      expect(page).to have_content 'Group was created successfully'
    end
  end
end
