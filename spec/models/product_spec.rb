require 'rails_helper'

RSpec.describe Product, type: :model do

  before do
    @category = Category.new(name: 'Climbers')
    @category.save
  end

  describe 'Validations' do
    it 'should save new product when all required fields are set' do
      @product = Product.new(name: 'White Rose', description: 'White roses have a profound, plain, and enigmatic side by their genuineness and their purity.', category: @category, quantity: 45, price: 3999)

      @product.validate
      
      expect(@product).to be_valid
    end

    it 'should produce an error if name is blank' do
      @product = Product.new(description: 'Fusce in blandit libero. Duis eget tincidunt lorem.', category: @category, quantity: 90, price: 2599)

      @product.validate

      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should produce an error if price is blank' do
      @product = Product.new(name: 'True Jasmine', description: 'Suspendisse eleifend imperdiet tellus non consectetur.', category: @category, quantity: 60)

      @product.validate

      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should produce an error if quantity is blank' do
      @product = Product.new(name: 'Chocolate Vine', description: 'Fusce in blandit libero', category: @category, price: 2599)

      @product.validate
      
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should produce an error if category is blank' do
      @product = Product.new(name: 'Downy Clematis', description: 'Donec vel commodo', quantity: 100, price: 5999)

      @product.validate

      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end