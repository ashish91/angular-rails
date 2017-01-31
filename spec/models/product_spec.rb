require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { build :product }

  it 'creates a product' do
    product.save
    expect(Product.count).to eq(1)
  end

  it 'updates product' do
    name = 'test'
    product.update_attributes(name: name)
    expect(product.name).to eq(name)
  end

  it 'deletes product' do
    product.destroy
    expect(Product.count).to eq(0)
  end

end