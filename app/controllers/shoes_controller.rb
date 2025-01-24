class ShoesController < ApplicationController
  before_action :set_shoes, only: %i[ show edit update destroy ]

  # GET /shoes or /shoes.json
  def index
    @shoes = Shoes.ordered
  end

  # GET /shoes/1 or /shoes/1.json
  def show
  end

  # GET /shoes/new
  def new
    @shoes = Shoes.new
  end

  # GET /shoes/1/edit
  def edit
  end

  # POST /shoes or /shoes.json
  def create
    @shoes = Shoes.new(shoes_params)

    respond_to do |format|
      if @shoes.save
        format.html { redirect_to @shoes, notice: "Shoes was successfully created." }
        format.json { render :show, status: :created, location: @shoes }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shoes.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shoes/1 or /shoes/1.json
  def update
    respond_to do |format|
      if @shoes.update(shoes_params)
        format.html { redirect_to @shoes, notice: "Shoes was successfully updated." }
        format.json { render :show, status: :ok, location: @shoes }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shoes.errors, status: :unprocessable_entity }
      end
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
      @shoes = Shoes.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def shoes_params
      params.expect(shoes: [ :brand, :model, :size, :purchased_at, :price, :retired_at ])
    end
end
