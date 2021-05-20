feature 'edits a bookmark' do
  scenario 'user can edit a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.google.com', title: 'google')
    visit('/bookmarks')
    expect(page).to have_link('google', href: 'http://www.google.com')

    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"
    fill_in('url', with: "http://www.bing.com")
    fill_in('title', with: "bing")
    click_button('Submit')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('google', href: 'http://www.google.com')
    expect(page).to have_link('bing', href: 'http://www.bing.com')
  end
  
end
