feature 'Deletes a bookmark' do
  scenario 'Deletes a bookmark' do
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'makers')
    visit '/bookmarks'
    expect(page).to have_link('makers', href: 'http://www.makersacademy.com')
    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('makers', href: 'http://www.makersacademy.com')
  end
end