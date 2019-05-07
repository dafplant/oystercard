require 'oystercard'

describe Oystercard do
  it "displays a balance of 0 on a new card" do
    expect(subject.balance).to eq(0)
  end

  it "adds a value to the card balance" do
    subject.top_up(4)
    expect(subject.balance).to eq(4)
  end

end
