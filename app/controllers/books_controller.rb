class BooksController < Sinatra::Base
  before do
    @data = JSON.parse(request.body.read) rescue {}
  end

  get '/books' do
    @books = Book.all
    @books.to_json
  end

  get '/books/:id' do
    Book[params[:id]].to_json
  end

  post '/books' do
    @book = Book.new(@data)

    if @book.valid?
      @book.save
      @book.to_json
    else
      status 422
      @book.errors.to_json
    end
  end

  put '/books' do
    @book = Book.find :id => @data['id']
    @data.delete('id')
    @book.update(@data)
  end

  delete '/books/:id' do
    @book = Book.find params[:id]
    @book.delete
  end
end
