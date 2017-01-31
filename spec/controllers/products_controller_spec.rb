require "rails_helper"

RSpec.describe ProductsController, type: :controller do
  render_views

  let(:create_products) {
    5.times.map do
      create :product
    end
  }

  let(:random_product) {
    create_products.sample
  }

  let(:sample_product_data) {
    {
        name: Faker::Name.name,
        description: Faker::Name.title,
        price: Faker::Number.between(1, 1000)
    }
  }

  before do
    create_products
  end

  describe "GET products" do
    it "has a 200 status code" do
      get :index, format: :json

      expect(response.status).to eq(200)
    end

    it "gets all the products" do
      get :index, format: :json

      expect(JSON.parse(response.body)["products"].count).to eq(create_products.count)
    end
  end

  describe "create products" do
    it "returns 200 status code" do
      post :create, { product: sample_product_data, format: :json }

      expect(response.status).to eq(200)
    end

    it "new product added to database" do
      post :create, { product: sample_product_data, format: :json }
      product_id = JSON.parse(response.body)["id"]

      expect(Product.exists?(product_id)).to be_truthy
    end

    it "returns 422 if param format not correct" do
      post :create, { products: sample_product_data, format: :json }

      expect(response.status).to eq(422)
    end
  end

  describe "update products" do
    it "returns 200 status code" do
      put :update, { id: random_product, product: sample_product_data, format: :json }

      expect(response.status).to eq(200)
    end

    it "product is updated in the database" do
      put :update, { id: random_product.id, product: sample_product_data, format: :json }

      saved_product = Product.find_by(id: random_product.id)
      expect(saved_product.name).to eq(sample_product_data[:name])
      expect(saved_product.description).to eq(sample_product_data[:description])
      expect(saved_product.price).to eq(sample_product_data[:price])
    end

    it "returns 422 if param format not correct" do
      put :update, { id: random_product.id, products: sample_product_data, format: :json }

      expect(response.status).to eq(422)
    end

    it "returns 404 when resource not found" do
      put :update, { id: -1, product: sample_product_data, format: :json }

      expect(response.status).to eq(404)
    end
  end

  describe "destroys products" do
    it "returns 200 status code" do
      product = create_products.sample
      delete :destroy, { id: product, format: :json }

      expect(response.status).to eq(200)
    end

    it "product is destroyed from the database" do
      product = create_products.sample
      delete :destroy, { id: product.id, product: sample_product_data, format: :json }

      expect(Product.exists?(product.id)).to be_falsey
    end

    it "returns 404 when resource not found" do
      delete :destroy, { id: -1, product: sample_product_data, format: :json }

      expect(response.status).to eq(404)
    end
  end
end