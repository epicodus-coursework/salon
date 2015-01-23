require('spec_helper')

describe(Stylist) do
  describe("#==") do
    it("is the same stylist if they have the same name") do
      test_stylist1 = Stylist.new({:stylist_name => "Jane", :id => nil})
      test_stylist2 = Stylist.new({:stylist_name => "Jane", :id => nil})
      expect(test_stylist1).to(eq(test_stylist2))
    end
  end

  describe("#stylist_name") do
    it("allows you to enter a name for the stylist") do
      test_stylist = Stylist.new({:stylist_name => "Jane", :id => nil})
      expect(test_stylist.stylist_name()).to(eq("Jane"))
    end
  end

  describe("#id") do
    it("assigns an ID to the stylist when you save it") do
      test_stylist = Stylist.new({:stylist_name => "Jane", :id => nil})
      test_stylist.save()
      expect(test_stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#client_names") do
    it("returns an array of clients for a stylist") do
      test_stylist = Stylist.new({:stylist_name => "Jane", :id => nil})
      test_stylist.save()
      test_client1 = Client.new({:client_name => "Ruby", :stylist_id => test_stylist.id()})
      test_client1.save()
      test_client2 = Client.new({:client_name => "Pearl", :stylist_id => test_stylist.id()})
      test_client2.save()
      expect(test_stylist.client_names()).to(eq([test_client1, test_client2]))
    end
  end

  describe(".all") do
    it("begins with an empty list of stylists") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a name to our list of saved stylists") do
      test_stylist = Stylist.new({:stylist_name => "Jane", :id => nil})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe(".find") do
    it("returns a stylist by their ID") do
      test_stylist1 = Stylist.new({:stylist_name => "Jane", :id => nil})
      test_stylist1.save()
      test_stylist2 = Stylist.new({:stylist_name => "Joanne", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe("#update") do
    it("allows you to update the stylist in our database") do
      stylist = Stylist.new({:stylist_name => "Jane", :id => nil})
      stylist.save()
      stylist.update({:stylist_name => "Jamie"})
      expect(stylist.stylist_name()).to(eq("Jamie"))
    end
  end

  describe("#delete") do
    it("lets you delete a stylist from the database") do
      stylist1 = Stylist.new({:stylist_name => "Jane", :id => nil})
      stylist1.save()
      stylist2 = Stylist.new({:stylist_name => "Jamie", :id => nil})
      stylist2.save()
      stylist1.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end

    it("deletes a stylist's clients from the database") do
      stylist = Stylist.new({:stylist_name => "Jane", :id => nil})
      stylist.save()
      client1 = Client.new({:client_name => "Ruby", :stylist_id => stylist.id()})
      client1.save()
      client2 = Client.new({:client_name => "Pearl", :stylist_id => stylist.id()})
      client2.save()
      stylist.delete()
      expect(Client.all()).to(eq([]))
    end
  end
end
