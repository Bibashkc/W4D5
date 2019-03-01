require 'spec_helper'
require 'rails_helper'

feature 'sign up process', type: :feature do 
    scenario 'has a new user page' do 
        visit new_user_url
        expect(page).to have_content 'Username'
        expect(page).to have_content 'Password'
    end

    feature 'signing up a user' do
        create(:user)
        scenario 'shows username on the homepage after signup' do
            expect(page).to have_content User.last.username
        end
    end
end

