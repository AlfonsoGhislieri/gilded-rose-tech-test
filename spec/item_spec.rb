require('item')

describe Item do
  subject = Item.new("Test",1,2)

  it 'stores the values of the item' do
    expect(subject.name).to eq("Test")
    expect(subject.sell_in).to eq(1)
    expect(subject.quality).to eq(2)
  end

  it '#to_s converts object to viewable string' do
    expect(subject.to_s).to eq("Test, 1, 2")
  end
end