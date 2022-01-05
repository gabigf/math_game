require './question'
require './player'

@player1 = Player.new('Player 1')
@player2 = Player.new('Player 2')

@currPlayer = 1

def switch_player
  puts "----- NEW TURN -----"
  if @currPlayer == 1
    @currPlayer = 2
  else
    @currPlayer = 1
  end
end

puts "----- WELCOME TO THE MATH GAME -----"

while @player1.points > 0 && @player2.points > 0
  @question = Question.new
  puts "Player #{@currPlayer}: #{@question.question}"
  player_ans = gets.chomp

  if @question.is_correct(player_ans)
    puts "YES! You are correct."
    puts "P1: #{@player1.points}/3 vs P2: #{@player2.points}/3"
    switch_player
  else
    if @currPlayer == 1
      @player1.points -= 1
    else
      @player2.points -= 1
    end

    if @player1.points == 0
      puts "Player 2 wins with a score of #{@player2.points}/3"
      puts "----- GAME OVER -----"
      puts "Good bye!"
    elsif @player2.points == 0
      puts "Player 1 wins with a score of #{@player1.points}/3"
      puts "----- GAME OVER -----"
      puts "Good bye!"
    else 
      puts "Seriously? No!"
      puts "P1: #{@player1.points}/3 vs P2: #{@player2.points}/3"
      switch_player
    end
  end
end
