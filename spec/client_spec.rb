require('rspec')
require('client')

describe(Client) do
  describe("#client_name") do
    it("allows you to enter a name for the client") do
      test_client = Client.new({:client_name => "Jane"})
      expect(test_client.client_name()).to(eq("Jane"))
    end
  end

  describe(".all") do
    it("begins with an empty list of clients") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a name to our list of saved clients") do
      test_client = Client.new({:client_name => "Jane"})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end
end
