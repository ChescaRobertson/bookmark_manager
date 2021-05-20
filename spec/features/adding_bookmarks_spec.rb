feature 'Adds a new bookmark' do
  scenario 'user can add a bookmark to the Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.google.com')
    fill_in('title', with: 'google')
    click_button('Submit')

    expect(page).to have_link('google', href: 'http://www.google.com')
  end

  scenario 'user tries to add an incorrect url' do
  visit 'bookmarks/new'
  fill_in('url', with: 'this is not a bookmark')
  click_button('Submit')

  expect(page).not_to have_content 'this is not a bookmark'
  expect(page).to have_content 'You must submit a valid URL.'
  end
end
