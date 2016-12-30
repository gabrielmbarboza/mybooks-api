class Book < Sequel::Model
  plugin :json_serializer
  many_to_one :author
end
