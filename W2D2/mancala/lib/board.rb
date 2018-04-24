class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = place_stones
  end

  def place_stones
    board = Array.new(14) { Array.new }
    board.each_index do |idx|
      next if idx == 6 || idx == 13
      board[idx] = Array.new(4) { :stone }
    end
    board
  end

  def valid_move?(start_pos)
    unless (1..6).include?(start_pos) || (7..12).include?(start_pos)
      raise "Invalid starting cup"
    end
    true
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos].count
    @cups[start_pos] = []

    cup_idx = start_pos
    until stones == 0
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13
      if cup_idx == 6
        if current_player_name == @name1
          @cups[6] << :stone
          stones -= 1
        end
      elsif cup_idx == 13
        if current_player_name == @name2
          @cups[13] << :stone
          stones -= 1
        end
      else
        @cups[cup_idx] << :stone
        stones -= 1
      end
    end

    render
    next_turn(cup_idx)
  end



  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif cups[ending_cup_idx].count == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? { |cup| cup.empty? } ||
    @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    p1_count = @cups[6].count
    p2_count = @cups[13].count

    if p1_count == p2_count
      return :draw
    else
      if p1_count > p2_count
        @name1
      else
        @name2
      end
    end
  end
end
