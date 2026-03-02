class ShoesController < ApplicationController
  before_action :set_shoes, only: %i[ show edit update destroy ]

  # GET /shoes or /shoes.json
  def index
    @shoes = Current.shoes.ordered
  end

  # GET /shoes/new
  def new
    @shoes = Current.shoes.new
  end

  # POST /shoes or /shoes.json
  def create
    @shoes = Current.shoes.new(shoes_params)

    if @shoes.save
      redirect_to @shoes, notice: "Shoes was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shoes/1 or /shoes/1.json
  def update
    if @shoes.update(shoes_params)
      redirect_to @shoes, notice: "Shoes was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /shoes/1 or /shoes/1.json
  def destroy
    @shoes.destroy!

    respond_to do |format|
      format.html { redirect_to shoes_path, status: :see_other, notice: "Shoes was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shoes
      @shoes = Current.shoes.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def shoes_params
      params.expect(shoes: [ :brand, :model, :size, :purchased_at, :price, :retired_at ])
    end
end
