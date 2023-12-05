require './lib/card.rb'
require './lib/deck.rb'
require './lib/turn.rb'
require './lib/round.rb'
require './lib/card_generator.rb'

@cards = CardGenerator.new("cards.txt").cards

@deck = Deck.new(@cards)

@round = Round.new(@deck)

@card_count = 0

def category_selector
    unique_categories = []
    @cards.each do |card|
        unique_categories << card.category  
    end
    unique_categories.uniq!
end

def start_game_message
    puts "Welcome! You're playing with #{@cards.count} cards."
    puts "-------------------------------------------"
end

def game_rounds
    (@cards.count).times do
        @card_count += 1
        puts "This is card number #{@card_count} out of #{@cards.count}."
        puts @round.current_card.question
    
        input1 = gets.chomp
        @round.take_turn(input1)
        @round.turns[-1].feedback
    end
end

def game_over_message
    puts "****** Game over! ******"
    puts "You had #{@round.number_correct} correct guesses out of #{@cards.count} for a total score of #{@round.percent_correct}%."
    category_selector.each do |category|
        puts "#{category} - #{@round.percent_correct_by_category(category)}% correct"
    end
end

def start
    start_game_message
    game_rounds
    game_over_message
end

start