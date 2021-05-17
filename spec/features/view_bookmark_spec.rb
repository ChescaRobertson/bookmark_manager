
feature 'View bookmarks' do
  scenario 'Allows you to view the bookmarks' do
  visit '/bookmarks'
  expect(page).to have_content 'http://www.google.com'
  end
end