feature 'adding and viewing comments' do
  scenario 'a user can add a comment' do
    bookmark = Bookmark.create(url: 'http://www.bing.com', title: 'bing')

    visit '/bookmarks'
    first('.bookmark').click_button 'Add Comment'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/comments/new"

    fill_in 'comment', with: 'comment test'
    click_button 'Submit'

    expect(current_path).to eq '/bookmarks'
    expect(current_path).to have_content 'comment test'
  end
end
