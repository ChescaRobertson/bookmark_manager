feature 'Adds a new bookmark' do
  scenario 'user can add a bookmark to the Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.google.com')
    fill_in('title', with: 'google')
    click_button('Submit')

    expect(page).to have_link('google', href: 'http://www.google.com')
  end
end
