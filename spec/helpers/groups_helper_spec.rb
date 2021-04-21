require 'rails_helper'

RSpec.describe GroupsHelper, type: :helper do
  let(:user) { User.new(name: 'abdul khaliq', id: 1) }

  def login_user(user)
    visit '/login'
    fill_in 'name', with: user.name
    click_button 'LogIn'
  end

  describe GroupsHelper do
    describe 'created event button' do
      it 'check User is sign in or not' do
        user.save
        login_user(user)
        expect(page).to have_selector(:link_or_button, 'Create new Group')
      end
    end
  end
end
