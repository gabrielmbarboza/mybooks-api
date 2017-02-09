class AuthorsController < Sinatra::Base
  before do
    @data = JSON.parse(request.body.read) rescue {}
  end

  get '/authors' do
    @authors = Author.all
    @authors.to_json
  end

  get '/authors/:id' do
    Author[params[:id]].to_json
  end

  post '/authors' do
    @author = Author.new(@data)

    if @author.valid?
      @author.save
      @author.to_json
    else
      status 422
      @author.errors.to_json
    end
  end

  put '/authors' do
    @author = Author.find id: @data['id']
    @data.delete('id')
    @author.update(@data)
  end

  delete '/authors/:id' do
    @author = Author.find params[:id]
    @author.delete
  end
end
