require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "decrements the quantity of conjured item twice" do
      items = [Item.new("Conjured Mana Cake", 12, 12)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 10
    end

    it "quality will not be decremented for Conjured item as it is already zero" do
      items = [Item.new("Conjured Mana Cake", 2, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end
  end

end
