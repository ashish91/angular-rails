class ProductsController < ApplicationController
  before_action :check_product_exists, only: [ :update, :destroy ]

  def create
    @product = Product.create(product_params)
  end

  def index
    @products = Product.all
  end

  def update
    @product.update(product_params)
  end

  def destroy
    @product.destroy

    render status: 200, json: {}.to_json
  end

  private
  def check_product_exists
    @product = Product.find_by(id: params[:id])

    unless @product.present?
      not_found
      return false
    end
  end

  def product_params
    params.require(:product).permit(:name, :price, :description)
  end
end
