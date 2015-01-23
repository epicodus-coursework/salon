class Client
  @@all_clients = []

  attr_reader(:client_name)

  define_method(:initialize) do |attributes|
    @client_name = attributes.fetch(:client_name)
  end

  define_singleton_method(:all) do
    @@all_clients
  end

  define_method("save") do
    @@all_clients.push(self)
  end
end
