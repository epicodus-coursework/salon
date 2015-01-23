class Stylist
  attr_reader(:stylist_name, :id)

  define_method(:initialize) do |attributes|
    @stylist_name = attributes.fetch(:stylist_name)
    @id = attributes.fetch(:id)
  end

  define_method(:client_names) do
    stylists_clients = []
    client_names = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()};")
    client_names.each() do |name|
      client_name = name.fetch("client_name")
      stylist_id = name.fetch("stylist_id").to_i()
      stylists_clients.push(Client.new({:client_name => client_name, :stylist_id => stylist_id}))
    end
    stylists_clients
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      stylist_name = stylist.fetch("stylist_name")
      id = stylist.fetch("id").to_i()
      stylists.push(Stylist.new({:stylist_name => stylist_name, :id => id}))
    end
    stylists
  end

  define_method("save") do
    result = DB.exec("INSERT INTO stylists (stylist_name) VALUES ('#{@stylist_name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |new_stylist|
    self.stylist_name().==(new_stylist.stylist_name()).&(self.id().==(new_stylist.id()))
  end

  define_singleton_method(:find) do |id|
    found_stylist = nil
    Stylist.all().each() do |stylist|
      if stylist.id().==(id)
        found_stylist = stylist
      end
    end
    found_stylist
  end
end
