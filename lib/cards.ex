defmodule Cards do
  def create_deck do
    [
      "Ace", "Two", "Three", "Four", "Five",
      "Six", "Seven", "Eight", "Nine", "Ten",
      "Queen", "Jack", "king"
    ]
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end
end
