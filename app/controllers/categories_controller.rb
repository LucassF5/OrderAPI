class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]

  # GET /category
  def index
    puts "Current user: #{current_user}"
    puts "Chegou aqui"
    @categories = current_user.categories # Produtos do usuário atual
    render json: @categories
  end

  # GET /category/:id
  def show
    render json: @category
  end

  # POST /category
  def create
    # puts "Current user: #{current_user}"
    # puts "Product params: #{category_params}"
    @category = current_user.categories.build(category_params)
    # puts @category

    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /category/:id
  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /category/:id
  def destroy
    @category.destroy
    render json: { message: "Categoria deletada com sucesso." }
  end

  private

  def set_category
    # puts "PASSOU 2"
    @category = current_user.categories.find(params[:id])
    # puts @category
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end

end
