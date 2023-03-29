require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'creates a valid Product' do
      @category = Category.new
      @product = Product.new({
        name: 'Boston',
        price: 26.99,
        quantity: 5,
        category: @category
      })
      expect(@product).to be_valid
    end

    it 'fails with invalid name' do
      @category = Category.new
      @product = Product.new({
        name: nil,
        price: 26.99,
        quantity: 5,
        category: @category
      })
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:name]).to eq ["can't be blank"]
    end

    it 'fails with invalid price' do
      @category = Category.new
      @product = Product.new({
        name: 'Boston',
        quantity: 5,
        category: @category
      })
      expect(@product).to_not be_valid
      expect(@product.errors.messages.include?(:price))
    end

    it 'saves the correct quantity' do
      @category = Category.new
      @product = Product.new({
        name: 'Boston',
        price: 26.99,
        quantity: 5,
        category: @category
      })
      expect(@product.quantity).to eq(5)
    end

    it 'saves the correct category' do
      @category = Category.new
      @product = Product.new({
        name: 'Boston',
        price: 26.99,
        quantity: 5,
        category: @category
      })
      expect(@product.category).to eq(@category)
    end
  end
end
