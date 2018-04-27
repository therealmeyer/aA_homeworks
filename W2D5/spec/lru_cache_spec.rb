require 'lru_cache'
require 'rspec'


RSpec.describe LRUCache do
  subject(:cache) { LRUCache.new(4) }

  describe "#initialize" do
    it "initializes cache to be an empty array" do
      expect(cache.cache).to be_empty
    end
  end

  describe "#add" do
    it "adds an element to the cache" do
      cache.add(3)
      expect(cache.cache).to include(3)
    end

    context "when adding an element to the cache that already exists" do
      before(:each) do
        cache.add(5)
        cache.add([1,2])
        cache.add("hello")
        cache.add(5)
      end
      it "moves that element to the back of the cache" do
        expect(cache.cache.last).to eq(5)
      end
      it "cache does not contain two instances of the added element" do
        expect(cache.cache.count(5)).to eq(1)
      end
    end

    context "when adding an element and the cache is full" do
      it "deletes the LRU element in the cache and adds the new one" do
        cache.add(5)
        cache.add([7,5])
        cache.add(21)
        cache.add("yes")
        cache.add(30)
        expect(cache.cache).to eq([[7,5],21,"yes",30])
      end
    end
  end

  describe "#count" do
    it "returns the count of the number of elements in the cache" do
      cache.add(5)
      cache.add([7,5])
      cache.add("yes")
      expect(cache.count).to eq(3)
    end
  end

  describe "#show" do
    it "shows the current state of the cache" do
      cache.add(5)
      cache.add([7,5])
      cache.add("yes")
      expect { cache.show }.to output(/[5,[7,5],"yes"]/).to_stdout
    end
  end
end
