require 'oystercard'

describe Oystercard do
  it "displays a balance of 0 on a new card" do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do
    it "adds a value to the card balance" do
      subject.top_up(4)
      expect(subject.balance).to eq(4)
    end
    it "will not top up after a certain limit" do
      max_balance = Oystercard::LIMIT
      subject.top_up(max_balance)
      expect{subject.top_up(1)}.to raise_error "Cannot go past #{max_balance}"
    end
  end
end
