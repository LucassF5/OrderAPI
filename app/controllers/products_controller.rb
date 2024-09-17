class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    @products = current_user.products # Produtos do usuário atual
    render json: @products
  end

  # GET /products/:id
  def show
    render json: @product
  end

  # POST /products
  def create
    puts "Current user: #{current_user}"
    puts "Product params: #{product_params}"
    @product = current_user.products.build(product_params)
    puts @product

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
    # puts "PASSOU 2"
    @product = current_user.products.find(params[:id])
    # puts @product
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity, :category_id)
  end

end
