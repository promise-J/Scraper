require './lib/scrape'
require './lib/scrape_instruction'

describe Scrape do
  let(:test_scrape) { Scrape.new('https://javascript.info') }

  it 'inherits behavior from the superclass ScrapeInstruction' do
    expect(Scrape.superclass).to eq(ScrapeInstruction)
  end

  describe '#complete_page' do
    it 'is expected to return a Nokogiri object type' do
      expect(test_scrape.complete_page.class).to eql(Nokogiri::HTML::Document)
    end
  end

  describe '#parts' do
    it 'returns an Array object type' do
      expect(test_scrape.parts.class).to eql(Array)
    end

    it 'returns 3 when counted' do
      expect(test_scrape.parts.count).to eql(3)
    end
  end

  describe '#categories_title' do
    it 'returns an Array object type' do
      expect(test_scrape.categories_title.class).to eql(Array)
    end

    it 'returns 27 when counted' do
      expect(test_scrape.categories_title.count).to eql(27)
    end
  end

  describe '#categories_with_url' do
    it 'returns an Array object type' do
      expect(test_scrape.categories_with_url.class).to eql(Array)
    end

    it 'returns true if all the elements in the array are hash' do
      check_hash = true
      test_scrape.categories_with_url.each do |category|
        if category.class != Hash
          check_hash = false
          break
        end
      end
      expect(check_hash).to eq true
    end
  end

  describe '#categories' do
    it 'returns an Array object type' do
      expect(test_scrape.categories.class).to eql(Array)
    end

    it 'returns true if all the elements in the array are Nokogiri html nodeset' do
      cat = true
      test_scrape.categories.each do |category|
        if category.class != Nokogiri::XML::NodeSet
          cat = false
          break
        end
      end
      expect(cat).to eq true
    end
  end

  #   it 'returns the icon that represents a player2' do
  #     expect(player2.icon).to eql('O')
  #   end
  # end

  # describe '#win_message' do
  #   it 'returns the winning message for the player that wins the game' do
  #     expect(player.win_message).to eql('Congratulations!!! player1 is the Winner...')
  #   end
  # end

  # describe '#false_move_message' do
  #   it 'returns a message for any false move by a player' do
  #     expect(player.false_move_message).to eql('Invalid move by player1, try again!')
  #   end
  # end
end

