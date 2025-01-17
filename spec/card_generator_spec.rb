require './lib/card_generator.rb'
require './lib/card.rb'
require 'pry'

RSpec.describe CardGenerator do
    it 'exists' do
        filename = "cards.txt"
        cg = CardGenerator.new(filename)

        expect(cg).to be_a(CardGenerator)
    end

    it 'can read a text file' do
        filename = "cards.txt"
        cg = CardGenerator.new(filename)

        expect(cg.read_file).to eq(["What is 5 + 5?,10,STEM","What is Rachel's favorite animal?,red panda,Turing Staff","What is Mike's middle name?,nobody knows,Turing Staff","What cardboard cutout lives at Turing?,Justin bieber,PopCulture"])
    end

    it 'can create cards from the separated data' do
        filename = "cards.txt"
        cg = CardGenerator.new(filename)

        cg.read_file
        cg.separate_data

        expect(cg.create_cards[0]).to be_a(Card)
    end

    it 'can create cards when instantiated' do
        filename = "cards.txt"
        cg = CardGenerator.new(filename)

        expect(cg.cards[0]).to be_a(Card)
        expect(cg.cards[1]).to be_a(Card)
        expect(cg.cards[2]).to be_a(Card)
        expect(cg.cards[3]).to be_a(Card)
    end
end