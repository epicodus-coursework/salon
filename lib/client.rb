class Client
  attr_reader(:client_name)

  define_method(:initialize) do |attributes|
    @client_name = attributes.fetch(:client_name)
  end
end
