require 'rails_helper'

feature "user can sign in and out" do
  context "user not signed in and on the homepage" do
    scenario "should see a 'sign in' link and a 'sign up' link" do
      visit ('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end
  end

  context "user sign in on the homepage" do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

      scenario "should see 'sign out' link" do
        visit('/')
        expect(page).to have_link('Sign out')
      end

      scenario "should not see a 'sign in' link and a 'sign up' link" do
        visit('/')
        expect(page).not_to have_link('Sign in')
        expect(page).not_to have_link('Sign up')
      end
    end

    context "Create a new restaurant" do

      scenario 'logged-in users can create a new restaurant' do
        visit('/')
        click_link('Sign up')
        fill_in('Email', with: 'test@example.com')
        fill_in('Password', with: 'testtest')
        fill_in('Password confirmation', with: 'testtest')
        click_button('Sign up')
        click_link 'Add a restaurant'
        expect(page).to have_button "Create Restaurant"
      end

      scenario 'Non logged-in users cannt create a new restaurant' do
        visit "/"
        click_link 'Add a restaurant'
        expect(page).to have_button "Log in"
        expect(page).not_to have_button "Create Restaurant"
      end
    end
end
