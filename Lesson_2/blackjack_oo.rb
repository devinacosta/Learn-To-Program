## Blackjack Game by Devin Acosta (Object-Oriented way)

class Card

  attr_reader :value, :face

  def initialize(suite, face)
    @suite = suite
    @face = face
    @value = return_value(face)
  end

  def to_s
    "#{@face}=>:#{@suite}"
  end

  def return_value(card)
    case card
      when :ace
        return 1
      when :two
        return 2
      when :three
        return 3
      when :four
        return 4
      when :five
        return 5
      when :six
        return 6
      when :seven
        return 7
      when :eight
        return 8
      when :nine
        return 9
      else
        return 10
    end
  end

end

class Deck

  def initialize
    @deck = []
    suits = [ :clubs, :hearts, :spades, :diamonds ]
    faces = [ :two, :three, :four, :five, :six, :seven, :eight, :nine, :ace, :jack, :king, :queen ]

    faces.each do |face|
      suits.each do |suite|
        @deck << Card.new(suite, face)
      end
    end

    self.shuffle!

  end

  def shuffle!
    @deck.sort_by! { rand }
  end

  def show_deck
    @deck.each do |card|
      puts "#{card}"
    end
  end

  def deal_card
    @deck.pop
  end

end

class Player

  attr_accessor :name

  def initialize(name='Player')
    @name = name
  end

end

class Dealer < Deck

  attr_accessor :name, :continue_game, :winner

  def initialize(name='Dealer')

    @dealers_cards = []
    @players_cards = []
    @dealers_total = 0
    @players_total = 0

    @name = name
    @deck = Deck.new
    @continue_game = true
    self.initial_deal
  end


  def initial_deal

    2.times { @dealers_cards << @deck.deal_card }
    2.times { @players_cards << @deck.deal_card }

  end


  def show_cards

    print "Player has " + "#{self.get_cards_total(@players_cards)}".rjust(2) + " :: Hand => ["
    @players_cards.each do |card|
      value = card.value
      print "#{card.to_s},"
    end
    puts " ]"

    print "Dealer has " + "#{get_cards_total(@dealers_cards)}".rjust(2) + " :: Hand => ["
    @dealers_cards.each do |card|
      value = card.value
      print "#{card.to_s},"
    end
    puts " ]"

  end

  def get_cards_total(cards)

    total = 0

    card_faces = cards.map { |x| x.face }
    card_values = cards.map { |x| x.value}

    if card_faces.include?(:ace)

      first = card_values.inject(:+)
      second = first + 10
      max_value = [first,second].max

      if max_value <= 21
        total = max_value
      else
        total = first
      end

    else
      card_values.each do |number|
        total += number
      end
    end

    total.to_i
  end

  def action(action)
    case action.strip
      when 'h'
        @players_cards << @deck.deal_card
        if get_cards_total(@players_cards) > 21
          self.continue_game = false
          print_game_result("PLAYER BUSTED!!, HOUSE WINS!!", @players_cards, @dealers_cards)
          self.winner = 'house'
        end
      when 's'
        # Have Dealer hit deck if dealer does not have 17
        while self.get_cards_total(@dealers_cards) < 17
          @dealers_cards << @deck.deal_card
        end

        if (get_cards_total(@players_cards) > 21)
          print_game_result "PLAYER BUSTED!!, HOUSE WINS!!", @players_cards , @dealers_cards
          self.winner = 'house'
          self.continue_game = false
        elsif (get_cards_total(@dealers_cards) > 21)
          print_game_result "DEALER BUSTER!!, PLAYER WINS!!", @players_cards, @dealers_cards
          self.winner = 'player'
          self.continue_game = false
        elsif (get_cards_total(@dealers_cards) == get_cards_total(@players_cards))
          print_game_result "IT'S A TIE!!!", @players_cards, @dealers_cards
          self.winner = 'tie'
          self.continue_game = false
        end

        if (get_cards_total(@players_cards) <= 21) && (get_cards_total(@players_cards) > get_cards_total(@dealers_cards))
          print_game_result "Player WINS the Round!", @players_cards, @dealers_cards
          self.winner = 'player'
          self.continue_game = false
        elsif (get_cards_total(@dealers_cards) <= 21) && (get_cards_total(@dealers_cards) > get_cards_total(@players_cards))
          print_game_result "Dealer WINS the Round!", @players_cards, @dealers_cards
          self.winner = 'house'
          self.continue_game = false
        end

      when 'q'
        puts "Thank you for Playing!!!"
        exit
    end
  end

  def question
    print "What would you like to do {h}it, {s}tay, {q}uit: "
    option = gets()
    puts ""
    self.action(option)
  end


  def print_game_result result, players_hand, dealers_hand
    puts '*'*100
    puts '*' + "#{result.center(98)}" + "*"
    puts '*'*100
    self.show_cards
    puts '*'*100

  end

end

class Blackjack

  attr_accessor :player, :dealer
  @@game_count = 0
  @@player_wins = 0

  def initialize
    @player = Player.new
    @dealer = Dealer.new
  end

  def get_intro
    puts '*'*100
    puts "Welcome to Blackjack (Object Oriented Version)"
    puts '*'*100
    print("What is your name: ")
    players_name = gets().chomp()
    player.name = players_name
    puts '-'*100
    @@continue_game = true
    @@game_count += 1
  end

  def play_again?

    # Get Winner From last game and add to count
    winner = @dealer.winner
    if winner == 'player'
      @@player_wins += 1
    end

    print "Would you like to play again {y}es {n}o: "
    answer = gets.chomp()

    case answer
      when 'n'

        puts ""
        puts "-"*100
        puts "*" + "FINAL SCORE".center(98) + "*"
        puts '-'*100
        puts "*" + "You have won #{@@player_wins} out of #{@@game_count} games!".center(98) + "*"
        puts '*'*100
        puts
        puts "Thanks for playing!!"
        exit
      when 'y'
        true
    end

  end

  ## Where the Game Magic happens
  def run
    if @@game_count == 0
      self.get_intro
    end

    while dealer.continue_game == true
      self.dealer.show_cards
      self.dealer.question
    end

    if play_again?
      @@game_count += 1
      @player = Player.new
      @dealer = Dealer.new
      puts ""
      self.run
    end

  end

end

### Actual Game
blackjack = Blackjack.new
blackjack.run