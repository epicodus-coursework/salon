require('rspec')
require('pg')
require('client')

DB = PG.connect({:dbname => 'salon_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM clients *;")
  end
end

describe(Client) do
  describe("#==") do
    it("is the same client if they have the same name and stylist ID") do
      test_client1 = Client.new({:client_name => "Jane", :stylist_id => 1})
      test_client2 = Client.new({:client_name => "Jane", :stylist_id => 1})
      expect(test_client1).to(eq(test_client2))
    end
  end

  describe("#client_name") do
    it("allows you to enter a name for the client") do
      test_client = Client.new({:client_name => "Jane", :stylist_id => 1})
      expect(test_client.client_name()).to(eq("Jane"))
    end
  end

  describe("#stylist_id") do
    it("reads the stylist ID") do
      test_client = Client.new({:client_name => "Jane", :stylist_id => 1})
      expect(test_client.stylist_id()).to(eq(1))
    end
  end

  describe(".all") do
    it("begins with an empty list of clients") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a name to our list of saved clients") do
      test_client = Client.new({:client_name => "Jane", :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end
end
