require('rspec')
require('client')

describe(Client) do
  describe("#client_name") do
    it("allows you to enter a name for the client") do
      test_client = Client.new({:client_name => "Jane"})
      expect(test_client.client_name()).to(eq("Jane"))
    end
  end
end
