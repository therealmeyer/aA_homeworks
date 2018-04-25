require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :name => "Gordon") }
  subject(:dessert) { Dessert.new('beignet', 50, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq('beignet')
    end
    it "sets a quantity" do
      expect(dessert.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients.empty?).to eq(true)
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new('brownie', '100',chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients).to_not include('chocolate')
      dessert.add_ingredient('chocolate')
      expect(dessert.ingredients).to include('chocolate')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["butter", "flour", "sugar", "vanilla"]
      ingredients.each do |ingredient|
        dessert.add_ingredient(ingredient)
      end
      expect(dessert.ingredients).to eq(ingredients)
      expect(dessert.mix!).not_to eq(ingredients)
      expect(dessert.ingredients.sort).to eq(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(dessert.quantity).to eq(50)
      dessert.eat(5)
      expect(dessert.quantity).to eq(45)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(55) }.to raise_error('not enough left!')
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return('Chef Gordon the Great Baker')
      expect(dessert.serve).to eq('Chef Gordon the Great Baker has made 50 beignets!')
    end

  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      chef.bake(dessert)
    end
  end
end
