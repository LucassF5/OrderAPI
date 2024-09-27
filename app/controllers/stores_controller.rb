class StoresController < ApplicationController
  # before_action :set_store, only: [:show, :update, :destroy]

  def create
    @store = current_user.create_store(store_params)

    if current_user.isLoja
      if @store.save
        render json: @store, status: :created
      else
        render json: @store.errors, status: :unprocessable_entity
      end
    else
      render json: {error: "User not authorized to be a store"}, status: :forbidden
    end
  end

  def index
    @stores = Store.all
    render json: @stores
  end

  def show
    render json: current_user.store
  end

  def update

  end

  def delete

  end

  private

  def set_store
    @store = current_user.stores.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {error: "Store not found"}, status: :not_found
  end

  def store_params
    params.require(:store).permit(:cnpj, :uf, :cep, :razao_social, :nome_fantasia, :user_id)
  end
end
