require('gilded_rose')

describe GildedRose do
  context 'Aged Brie' do
    before do
      @aged_brie = Item.new('Aged Brie', 5, 5)
    end

    it 'increases in quality as sell_in decreases' do
      items = [@aged_brie]

      expect do
        GildedRose.new(items).update_quality
      end.to change { @aged_brie.quality }.from(5).to(6)
                                          .and change { @aged_brie.sell_in }.from(5).to(4)
    end

    it 'increases in quality by 2 after sell_in reaches 0' do
      @aged_brie.sell_in = 0
      items = [@aged_brie]

      expect do
        GildedRose.new(items).update_quality
      end.to change { @aged_brie.quality }.from(5).to(7)
                                          .and change { @aged_brie.sell_in }.from(0).to(-1)
    end

    it 'increases in quality by 2 after sell_in is below 0' do
      @aged_brie.sell_in = -1
      items = [@aged_brie]

      expect do
        GildedRose.new(items).update_quality
      end.to change { @aged_brie.quality }.from(5).to(7)
                                          .and change { @aged_brie.sell_in }.from(-1).to(-2)
    end
  end

  context 'Sulfuras, Hand of Ragnaros' do
    before do
      @sulfuras = Item.new('Sulfuras, Hand of Ragnaros', 1, 1)
    end

    it 'never changes in quality' do
      items = [@sulfuras]

      expect do
        GildedRose.new(items).update_quality
      end.to_not change { @sulfuras.quality }.from(1)
    end

    it 'sell_in never decreases' do
      items = [@sulfuras]

      expect do
        GildedRose.new(items).update_quality
      end.to_not change { @sulfuras.sell_in }.from(1)
    end
  end

  context 'Backstage passes' do
    before do
      @backstage = Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 10)
    end

    it 'increases by 1 when more than 10 days' do
      items = [@backstage]

      expect do
        GildedRose.new(items).update_quality
      end.to change { @backstage.quality }.from(10).to(11)
                                          .and change { @backstage.sell_in }.from(11).to(10)
    end

    it 'increases by 2 when there are 10 days or less' do
      @backstage.sell_in = 10
      items = [@backstage]

      expect do
        GildedRose.new(items).update_quality
      end.to change { @backstage.quality }.from(10).to(12)
                                          .and change { @backstage.sell_in }.from(10).to(9)
    end

    it 'increases by 3 when there are 5 days or less' do
      @backstage.sell_in = 5
      items = [@backstage]

      expect do
        GildedRose.new(items).update_quality
      end.to change { @backstage.quality }.from(10).to(13)
                                          .and change { @backstage.sell_in }.from(5).to(4)
    end

    it 'drops to 0 after the sell date' do
      @backstage.sell_in = 0
      items = [@backstage]

      expect do
        GildedRose.new(items).update_quality
      end.to change { @backstage.quality }.from(10).to(0)
                                          .and change { @backstage.sell_in }.from(0).to(-1)
    end
  end

  context 'Generic Quality' do
    before do
      @test = Item.new('Test', 10, 10)
    end

    it 'quality degrades by 1 normally' do
      items = [@test]

      expect do
        GildedRose.new(items).update_quality
      end.to change { @test.quality }.from(10).to(9)
                                     .and change { @test.sell_in }.from(10).to(9)
    end

    it 'quality degrades by 2 after sell by date' do
      @test.sell_in = 0
      items = [@test]

      expect do
        GildedRose.new(items).update_quality
      end.to change { @test.quality }.from(10).to(8)
                                     .and change { @test.sell_in }.from(0).to(-1)
    end

    it 'is never negative' do
      @test.quality = 0
      items = [@test]

      expect do
        GildedRose.new(items).update_quality
      end.to_not change { @test.quality }.from(0)
      expect(@test.sell_in).to eq(9)
    end

    it 'can never increase to more than 50' do
      aged_brie = Item.new('Aged Brie', 5, 50)
      items = [aged_brie]

      expect do
        GildedRose.new(items).update_quality
      end.to_not change { aged_brie.quality }.from(50)
      expect(aged_brie.sell_in).to eq(4)
    end
  end

  context '#update_quality' do
    it 'does not change the name' do
      test_item = Item.new('foo', 0, 0)
      items = [test_item]
      GildedRose.new(items).update_quality
      expect(test_item.name).to eq 'foo'
    end
  end
end
