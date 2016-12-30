class Author < Sequel::Model
  plugin :json_serializer
  one_to_many :books
end
