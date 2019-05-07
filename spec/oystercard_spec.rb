require 'oystercard'

describe Oystercard do
  it "displays a balance of 0 on a new card" do
    expect(subject.balance).to eq(0)
  end
end
