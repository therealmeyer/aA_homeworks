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
    [key,value]
  end

  def lookup(key)
    @map.each { |pair| return pair[1] if key == pair[0] }
    nil
  end

  def remove(key)
    @map.reject! { |pair, idx| key == pair[0] }
    nil
  end

  def show
    deep_dup(@map)
  end

  private
  def deep_dup(arr)
    arr.map do |el|
      if el.is_a?(Array)
        deep_dup(el)
      else
        el
      end
    end 
  end


end
