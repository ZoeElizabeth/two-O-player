class Game

  attr_accessor :answer

  @@players = []

  def self.get_players player

    @@players << player

  end

  def initialize 
  
  end

  def loop
    while @@players.length > 1
     self.round
    end
  end


  def round 
    self.new_question
    puts @answer
    @player_answer = $stdin.gets.chomp.to_i
    
    @@players.each do |player|
    # self.compare_answer
    puts player.name
    # grabs new question and answer
      if self.compare_answer? == true
        puts "YES! you are correct.".green
        
      else 
        puts "Seriously? No".red
          player.lose_life
          
      end    
    end

    puts @answer

   self.remove_dead_players
   self.loop
   
  end

  def compare_answer?
    @player_answer == @answer
  end
   
  def remove_dead_players

    @@players.each do |player|

      if player.lives == 0
        @@players.delete(player)
      end

      if @@players.length == 1
        puts "----GAME OVER------"
        puts "winner #{@@players[0].name}"
      end
    end
  end


  def new_question
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = @num1 + @num2
    puts "What is #{@num1} + #{@num2}?".yellow
  end

end



# class Question < Game
#   @num1 = rand(1..20)
#   @num2 = rand(1..20)
#   @answer = @num1 + @num2
#   "What is #{@num1} + #{@num2}?"
# end

