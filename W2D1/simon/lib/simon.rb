require 'colorize'
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    puts "This is Simon, remember the color sequence"
    sleep(2)
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    color_hash = {"red"=>:red, "blue"=>:blue, "green"=>:green, "yellow"=>:yellow}
    add_random_color
    seq.each do |color|
      print "#{color.colorize(color_hash[color])} "
      sleep(1)
    end
    system("clear")
  end

  def require_sequence
    seq_hash = { "R"=>'red', "B"=>'blue', "G"=>'green', "Y"=>'yellow' }
    print "What was the sequence? Type: 'RBG...' "
    user_seq = gets.chomp.split("")
    user_seq = user_seq.map { |color| color = seq_hash[color.upcase]}
    if user_seq != seq 
      @game_over = true
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "SUCCESS! Correct Sequence"
  end

  def game_over_message
    puts "Wrong sequence. GAME OVER!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  if __FILE__ == $PROGRAM_NAME
    puts 'o'.colorize(:red)
    Simon.new.play
  end


end
