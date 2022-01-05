class Question
  attr_accessor :question, :answer

  def initialize
    num1 = rand(1...20)
    num2 = rand(1...20)
    @question = "What is #{num1} + #{num2}?"
    @answer = num1 + num2
  end

  def is_correct(player_ans)
  player_ans == @answer.to_s ? true : false
  end

end
