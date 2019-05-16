class ProductsController < ApplicationController
  # before_action :set_product, only: [:show, :edit, :update]

  def description
    product = Product.find(params[:id])
    render body: product.description
  end

  def inventory
    product = Product.find(params[:id])
    if product.inventory == 0
      render body: "false"
    else
      render body: "true"
    end
  end

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end
  #
  def create
    @product = Product.create(product_params)
    redirect_to products_path
  end

private
#
  # def set_product
  #   @product = Product.find(params[:id])
  # end
#
  def product_params
  params.require(:product).permit(:name, :price, :inventory, :description)
  end


end
