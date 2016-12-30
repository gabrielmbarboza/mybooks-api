require 'sinatra'
require 'sequel'
require 'json'
require 'rack/parser'

DB = Sequel.connect(:adapter => 'postgres', :user => '', :host => '', :database => 'mybooks',:password=>'')
Sequel::Model.plugin :json_serializer

Dir.glob('./app/{models,helpers,controllers}/*.rb').each { |file| require file }

map('/api/v1') {
  run BooksController
  use AuthorsController
}
