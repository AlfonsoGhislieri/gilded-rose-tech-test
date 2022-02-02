require('gilded_rose')

describe GildedRose do
  context "Aged Brie" do
    it "increases in quality as it gets older" do
      items = [Item.new("Aged Brie", 5, 5)]
      expect { GildedRose.new(items).update_quality() }.to change {items[0].quality}.from(5).to(6)
    end
  end

  context "Quality" do 
    it "is never negative" do
      items = [Item.new("Test", 0, 0)]
      GildedRose.new(items).update_quality() 
      expect(items[0].quality).to_not eq(-1)
      expect(items[0].quality).to eq(0)
    end

    it "is never more than 50" do
      items = [Item.new("Aged Brie", 5, 50)]
      GildedRose.new(items).update_quality() 
      expect(items[0].quality).to_not eq(51)
      expect(items[0].quality).to eq(50)
    end
  end

  context "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end
  end
end
