class LRUCache
  attr_reader :cache
  def initialize(size)
    @cache = []
  end

  def count
    # returns number of elements currently in cache
    @cache.count
  end

  def add(el)
    # adds element to cache according to LRU principle
    if @cache.include?(el)
      @cache = @cache - [el] + [el]
    else
      @cache.shift if count == 4
      @cache.push(el)
    end
    el
  end

  def show
    # shows the items in the cache, with the LRU item first
    p @cache.dup
  end

  private
  # helper methods go here!


  end
