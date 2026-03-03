class ShoesController < ApplicationController
  before_action :set_shoes, only: %i[ show edit update destroy ]

  # GET /shoes
  def index
    @shoes = current_user.shoes.ordered
  end

  # GET /shoes/new
  def new
    @shoes = current_user.shoes.new
  end

  # POST /shoes
  def create
    @shoes = current_user.shoes.new(shoes_params)

    if @shoes.save
      redirect_to @shoes, notice: "Shoes was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shoes/1
  def update
    if @shoes.update(shoes_params)
      redirect_to @shoes, notice: "Shoes was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /shoes/1
  def destroy
    @shoes.destroy!

    redirect_to shoes_index_path, status: :see_other, notice: "Shoes was successfully destroyed."
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_shoes
    @shoes = current_user.shoes.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def shoes_params
    params.expect(shoes: [ :brand, :model, :size, :purchased_at, :retired_at ])
  end
end
