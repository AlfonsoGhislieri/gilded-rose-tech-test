require('gilded_rose')

describe GildedRose do
  context "Aged Brie" do
    it "increases in quality as it gets older" do
      items = [Item.new("Aged Brie", 5, 5)]
      expect { 
        GildedRose.new(items).update_quality() 
      }.to change {items[0].quality}.from(5).to(6)
      expect(items[0].quality).to eq(6)
    end
  end

  context "Sulfuras, Hand of Ragnaros" do
    it "never decreases in quality" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 1, 1)]
      expect { 
        GildedRose.new(items).update_quality() 
      }.to_not change {items[0].quality}.from(1)
      expect(items[0].quality).to eq(1)
    end
  end

  context "Backstage passes" do
    it "increases by 2 when there are 10 days or less" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
      subject = GildedRose.new(items)
      expect { 
        GildedRose.new(items).update_quality() 
      }.to change {items[0].quality}.from(10).to(12)
      expect(items[0].quality).to eq(12)
    end

    it "increases by 3 when there are 5 days or less" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
      subject = GildedRose.new(items)
      expect { 
        GildedRose.new(items).update_quality() 
      }.to change {items[0].quality}.from(10).to(13)
      expect(items[0].quality).to eq(13)
    end

    it "drops to 0 after the sell date" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
      subject = GildedRose.new(items)
      expect { 
        GildedRose.new(items).update_quality() 
      }.to change {items[0].quality}.from(10).to(0)
      expect(items[0].quality).to eq(0)
    end
  end

  context "Quality" do 
    it "quality degredaes x2 after sell by date" do
      items = [Item.new("Test", 0, 10)]
      expect { 
        GildedRose.new(items).update_quality() 
      }.to change {items[0].quality}.from(10).to(8)
      expect(items[0].quality).to eq(8)
    end

    it "is never negative" do
      items = [Item.new("Test", 0, 0)]
      expect { 
        GildedRose.new(items).update_quality() 
      }.to_not change {items[0].quality}.from(0)
      expect(items[0].quality).to eq(0)
    end

    it "is can never increase to more than 50" do
      items = [Item.new("Aged Brie", 5, 50)]
      expect { 
        GildedRose.new(items).update_quality() 
      }.to_not change {items[0].quality}.from(50)
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
