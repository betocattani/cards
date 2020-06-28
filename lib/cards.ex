defmodule Cards do
  @moduledoc """
    Providers methods to creating and handling a deck of cards
  """

  @doc """
    Returns a list of strings representing a deck of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Queen", "Jack", "king"]
    suits = ["Spades", "Clubs", "Heart", "Diamond"]

    # cards = for value <- values do
    #   for suit <- suits do
    #     "#{value} of #{suit}"
    #   end
    # end
    #
    # List.flatten(cards)

    # nestead comprehension
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  # Cards.deal(deck, 5) { *hand*, *deck* } - Tuple
  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many cards should
    be  in the  hand.

    ## Examples

          iex> deck = Cards.create_deck
          iex> { hand, deck } = Cards.deal(deck, 1)
          iex> hand
          ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist"
    end
  end

  def create_hand(hand_size) do
    # Pipe Operator inject automatically the new list into the first argument of shuffle result
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
