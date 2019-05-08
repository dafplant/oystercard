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

  # describe '#deduct' do
  #   it "deducts money from card" do
  #     expect{ subject.deduct(1) }.to change{ subject.balance }.by -1
  #   end
  # end

  describe '#in_journey?' do
    it "shows the journey status" do
      expect(subject).to respond_to(:in_journey?)
    end
    it "starts the journey not in use (false)" do
      expect(subject.in_journey?).to eq(false)
    end
  end

  describe '#touch_in' do
    it "is changed to true by #touch_in" do
      card = Oystercard.new
      card.top_up(5)
      expect{ card.touch_in(:station) }.to change{ card.in_journey? }.to eq(true)
    end

    it 'will raise error if balance is 0' do
      card = Oystercard.new
      expect{ card.touch_in(:station) }.to raise_error "Insufficient funds"
    end
  end


        # it 'will give the entry station' do
        #
        #   expect(card.entry_station).to eq('station')
        # end



  describe "let" do
    let(:station) { double :station }
      it 'gives the name of the station' do
        card = Oystercard.new
        card.top_up(5)
        card.touch_in(station)
        expect(card.entry_station).to eq station
      end
  end


    describe '#touch_out' do
      it "is changed to false by #touch_out" do
        card = Oystercard.new
        card.top_up(5)
        card.touch_in(:station)
        expect{ card.touch_out}.to change{ card.in_journey?}.to eq(false)
      end
      it 'will charge minimum_fare on touch out' do
        card = Oystercard.new
        card.top_up(5)
        card.touch_in(:station)
        expect { card.touch_out }.to change{ card.balance }.by -Oystercard::MINIMUM_FARE
      end

    end
end
