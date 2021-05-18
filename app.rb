require 'sinatra/base'
require 'sinatra/reloader'
require 'bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url])
    redirect '/bookmarks'
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  run! if app_file == $0
end
