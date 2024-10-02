class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  skip_before_action :authorized, only: [:index, :show]

  # GET /products
  def index
    @products = Product.all
    render json: @products
  end

  # GET /products/:id
  def show
    render json: @product
  end

  # POST /products
  def create
    @product = current_user.store.products.create(product_params)

    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/:id
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/:id
  def destroy
    @product.destroy
    render json: { message: "Produto deletado com sucesso." }
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity, :category_id)
  end

end
