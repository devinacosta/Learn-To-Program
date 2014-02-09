# BlackJack Game written by Devin Acosta

require 'pry'

SUITS = [ :clubs, :hearts, :spades, :diamonds ]
FACES = [ :two, :three, :four, :five, :six, :seven, :eight, :nine, :ace, :jack, :king, :queen ]

def create_deck
  deck = []
  FACES.each do |face|
    SUITS.each do |suit|
      deck << { face => suit }
    end
  end
  deck
end


def sort_deck(deck)
  deck.sort_by { rand }
end


## Hand start
def start_hand deck
    hand = []
    2.times do 
        hand << deck.pop
    end
    hand
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

def count_cards(hand)
  total = 0
  my_faces = hand.map{|card| card.keys.first}
  my_faces_integers = hand.map{|card| return_value(card.keys.first)}
  # my_suits = hand.map{|card| card.values.first}

  #puts "#{my_faces} #{my_suits} #{my_faces_integers}"

  #binding.pry

  if my_faces.include?(:ace)
    first = my_faces_integers.inject(:+)
    second = first + 10
    max_value = [first, second].max

    if max_value <= 21
      max_value
    else
      first
    end

  else
    hand.each do |key|
      key.each do |k,v|
        total += return_value(k)
      end
    end
    total
  end
end

def hit_hand(cards)
  card = $mydeck.pop
  cards << card
  cards
end

def print_hands(player,dealer)
  puts '*'*100
  puts "Dealer has " + "#{count_cards(dealer)}".rjust(2) + " :: Hand => #{dealer}"
  puts "Player has " + "#{count_cards(player)}".rjust(2) + " :: Hand => #{player}"
  puts '*'*100
  puts ''
end

def print_game_result result, players_hand, dealers_hand
  puts '*'*100
  print_hands(players_hand, dealers_hand)
  puts '*' + "#{result.center(98)}" + "*"
  puts '*'*100
end

def action

    # Catch if Player BUSTED
    if (count_cards($players_hand) > 21)
      print_game_result "Player BUSTED!!!, HOUSE WINS!", $players_hand, $dealers_hand
      $game_over = true
    end

    if (count_cards($dealers_hand) > 21)
      print_game_result "DEALER BUSTED!!!, Player WINS!"
      $game_over = true
    end

    if not $game_over
      print "What do you want to do? {q}uit {h}it {s}tay: "
      myact = gets.chomp
      case myact
      when 'h'
        $players_hand = hit_hand($players_hand)
      when 's'
        # First Make sure the Dealer hits if he has less than 17 count
        while count_cards($dealers_hand) < 17
          $dealers_hand = hit_hand($dealers_hand)
          #puts "Had to Hit, under 17 count, count is now #{count_cards($dealers_hand)}"
        end

        # Print Who Won The Game
        if (count_cards($players_hand) <= 21) && (count_cards($players_hand) > count_cards($dealers_hand))
          print ''
          print_game_result "Player WINS the Round!", $players_hand, $dealers_hand
          $game_over = true
        elsif (count_cards($dealers_hand) <= 21) && (count_cards($dealers_hand) > count_cards($players_hand))
          print_game_result "DEALER WINS the Round", $players_hand, $dealers_hand
          $game_over = true
        elsif count_cards($dealers_hand) > 21
          print_game_result "DEALER BUSTED, Player WINS!", $players_hand, $dealers_hand
          $game_over = true
        elsif (count_cards($dealers_hand) == count_cards($players_hand))
          print_game_result  "IT'S a TIE, no winner!", $players_hand, $dealers_hand
          $game_over = true
        end

      when 'q'
          puts "Thanks for Playing!!!"
          exit(0)
      end


    end

    if $game_over
      puts ''
      print ("Would you like to play again??? {y|n}: ")
      answers = gets.chomp()
      if (answers == 'yes' or answers == 'y')
        $game_over = false
        $players_hand = []
        $dealers_hand = []
        deck = create_deck
        $mydeck = sort_deck(deck)
        $players_hand = start_hand $mydeck
        $dealers_hand = start_hand $mydeck
        puts ''
      else
        puts "Thanks for playing!!!"
        exit(0)
      end
    end

    print_hands($players_hand,$dealers_hand)

end

## Main Program
puts "----- Welcome to BlackJack ----- "
puts ""

# Pre-sort the deck
deck = create_deck
$mydeck = sort_deck(deck)

# Set Variables
$game_over = false

# Show hands
$players_hand = start_hand $mydeck
$dealers_hand = start_hand $mydeck
print_hands($players_hand,$dealers_hand)

while true
  action
end
