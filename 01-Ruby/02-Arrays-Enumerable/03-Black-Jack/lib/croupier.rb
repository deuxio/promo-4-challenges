require_relative 'black_jack'

def state_of_the_game(player_score, bank_score)
  # TODO: return (not print!) a message containing the player's score and bank's score
  "Your score is #{player_score}, bank is #{bank_score}!"
end

def end_game_message(player_score, bank_score)
  # TODO: return (not print!) a message telling if the user won or lost.
  if player_score == 21
    "Black Jack ! you win."
  elsif player_score > 21
    "You are over 21! You lose."
  elsif player_score >= bank_score
    "You beat the bank! You win."
  else
    "The bank beats you! You lose."
  end

end

def play_game
  # TODO: make the user play from terminal in a while loop that will stop
  #       when the user will not be asking for a new card
  player_score = 0

  while answer == "yes" || answer == "y"
    player_score += pick_player_card
    puts "Card ? (type 'y' or 'yes' for a new card)"
  end
end
