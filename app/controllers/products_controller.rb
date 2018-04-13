class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def create
    # @product_attributes = {name: "Test", price: "3.99", inventory: 12, description: "This is a great thing"}
    # STDERR.puts params
    # @product=Product.create(products_params(:name,:description,:price,:inventory))
    @product=Product.create(name: params[:name],price: params[:price],inventory: params[:inventory],description: params[:description])
    # render @product
    redirect_to products_path
  end

  def description
    product=Product.find(params[:id])
    if product
      render plain: product.description
    else
      redirect_to :index
    end

  end

  def inventory
    product=Product.find(params[:id])
    haveProduct = false
    if product.inventory && product.inventory > 0
      haveProduct = true;
    end
    render plain: haveProduct
  end

  private
  def products_params(*args)
    params.require(:products).permit(*args)
  end
end
