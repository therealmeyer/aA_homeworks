class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    @map.each do |pair|
      if pair[0] == key
        pair[1] = value
        return [key, value]
      end
    end
    @map << [key, value]
  end

  def lookup(key)
    @map.each { |pair| return pair[1] if key == pair[0] }
    nil
  end

  def remove(key)
    el = nil
    @map.each_with_index do |pair, idx|
      el = @map.slice!(idx) if key == pair[0]
    end
    el 
  end

  def show
    p @map
  end


end
