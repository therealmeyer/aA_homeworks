# A Very Hungry Octopus wants to eat the longest fish
# in an array of fish.
# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh',
# 'fsh', 'fiiiissshhhhhh'] => "fiiiissshhhhhh"

def sluggish_octopus(fish)
  (0...fish.length-1).each do |idx1|
    longest = fish[idx1]
    (idx1+1...fish.length-2).each do |idx2|
      longest = fish[idx2] if fish[idx1].length < fish[idx2].length
    end
    return longest
  end
end

def dominant_octopus(fish)
  prc = Proc.new { |x,y| y.length <=> x.length }
  fish.merge_sort(&prc) [0]
end

def clever_octopus(fish)
  longest = fish.first
  (1...fish.length).each do |fish_idx|
    longest = fish[fish_idx] if longest.length < fish[fish_idx].length
  end
  longest
end

# DANCING OCTOPUS
# tiles = ["up", "right-up", "right", "right-down",
# # # # # "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles)
  tiles.each_with_index do |tile, idx|
    return idx if tile == direction
  end
end

# tile_hash = {
#   "up"=>0, "right-up"=>1, "right"=>2, "right-down"=>3,
#   "down"=>4, "left-down"=>5, "left"=>6, "left-up"=>7
# }

def fast_dance(direction, tile_hash)
  tile_hash[direction]
end

# merge_sort methods

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }
    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    return right if left.empty?
    return left if right.empty?
    if prc.call(left.first, right.first) == -1
      el = left.shift
    else
      el = right.shift
    end
    [el] + Array.merge(left, right, &prc)
  end
end
