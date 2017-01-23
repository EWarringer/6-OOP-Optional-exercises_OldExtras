require_relative 'deck'
require 'pry'

class Hand
  def initialize(cards)
    @cards = cards
  end

  def calculate_hand(cards)
    score = 0
    cards.each do |card|
      if ["J", "Q", "K"].include?(card.chop)
        score += 10
      elsif card.chop == "A"
        if score > 10
          score += 1
        else
          score += 11
        end
      else
        score += card.chop.to_i
      end
    end
    score
  end
end

deck = Deck.new
cards = deck.deal(2)
hand = Hand.new(cards)
# hand.calculate_score # Get this working properly
