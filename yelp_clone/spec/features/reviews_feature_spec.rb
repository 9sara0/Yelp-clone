feature 'reviewing' do
  before do
     Restaurant.create name: 'KFC'
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end
  scenario 'allows users to leave a review using a form' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "Love chicken"
    select '5', from: 'Rating'
    click_button 'Leave Review'

    expect(page).to have_content('Love chicken')
    expect(current_path).to eq '/restaurants'
  end
end
