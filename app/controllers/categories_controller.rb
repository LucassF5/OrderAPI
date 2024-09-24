class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]

  # GET /category
  def index
    @categories = current_user.categories # Produtos do usuário atual
    render json: @categories
  end

  # GET /category/:id
  def show
    render json: @category
  end

  # POST /category
  def create
    @category = current_user.categories.build(category_params)

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
    @category = current_user.categories.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end

end
