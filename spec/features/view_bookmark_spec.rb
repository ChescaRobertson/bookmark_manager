
require 'pg'

feature 'View bookmarks' do
  scenario 'Allows you to view the bookmarks' do

    Bookmark.create(url: 'http://www.makersacademy.com', title: 'makers')
    Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'destroy software')
    Bookmark.create(url: 'http://www.google.com', title: 'google')

    visit '/bookmarks'

    expect(page).to have_link('makers', href: 'http://www.makersacademy.com')
    expect(page).to have_link('destroy software', href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('google', href: 'http://www.google.com')
  end
end
