class Game


  # Dependency Injection
  def initialize(std_out, std_in)
    @std_out = std_out
    @std_in = std_in
  end

  def prompt
    @std_out.write("Choose your weapon: r/p/s\n")
  end

  def select
    @player = @std_in.read
  end

  def computer_move
    random_choice = rand(3)
    if random_choice == 0
      @pc = "r"
    elsif random_choice == 1
      @pc = "p"
    else
      @pc = "s"
    end
    return @pc
  end

  def result
    if @player == @pc
      "Draw"
    elsif @player == "r" && @pc == "p"
      "You lost"
    elsif @player == "r" && @pc == "s"
      "You won"
    elsif @player == "p" && @pc == "r"
      "You won"
    elsif @player == "p" && @pc == "s"
      "You lost"
    elsif @player == "s" && @pc == "r"
      "You lost"
    else @player == "s" && @pc == "p"
      "You won"
    end
  end

end
