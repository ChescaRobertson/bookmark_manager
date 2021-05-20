require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'
require './lib/comment'
require_relative './database_connection_setup.rb'
require 'uri'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post '/bookmarks' do
    if params['url'] =~ /\A#{URI::regexp(['http', 'https'])}\z/
      Bookmark.create(url: params['url'], title: params[:title])
    else
      flash[:notice] = "You must submit a valid URL."
    end
    redirect '/bookmarks'
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  get '/bookmarks/:id/comments/new' do
    @bookmark_id = params[:id]
    erb :'bookmarks/comments/new'
  end

  post '/bookmarks/:id/comments' do
    Comment.create(text: params[:comment], bookmark_id: params[:id])
    redirect '/bookmarks'
  end

  patch '/bookmarks/:id' do
    Bookmark.edit(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
