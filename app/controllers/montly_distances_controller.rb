class MontlyDistancesController < ApplicationController
  before_action :set_shoes, only: %i[ new create ]
  before_action :set_montly_distance, only: %i[ show edit update destroy ]

  # GET /montly_distances/1 or /montly_distances/1.json
  def show
  end

  # GET /montly_distances/new
  def new
    @montly_distance = @shoes.montly_distances.build
  end

  # GET /montly_distances/1/edit
  def edit
  end

  # POST /montly_distances or /montly_distances.json
  def create
    @montly_distance = @shoes.montly_distances.build(montly_distance_params)

    respond_to do |format|
      if @montly_distance.save
        format.html { redirect_to @montly_distance.shoes, notice: "Montly distance was successfully created." }
        format.json { render :show, status: :created, location: @montly_distance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @montly_distance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /montly_distances/1 or /montly_distances/1.json
  def update
    respond_to do |format|
      if @montly_distance.update(montly_distance_params)
        format.html { redirect_to @montly_distance, notice: "Montly distance was successfully updated." }
        format.json { render :show, status: :ok, location: @montly_distance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @montly_distance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /montly_distances/1 or /montly_distances/1.json
  def destroy
    @montly_distance.destroy!

    respond_to do |format|
      format.html { redirect_to @montly_distance.shoes, status: :see_other, notice: "Montly distance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_montly_distance
      @montly_distance = MontlyDistance.find(params.expect(:id))
    end

    def set_shoes
      @shoes = Shoes.find(params.expect(:shoes_id))
    end

    # Only allow a list of trusted parameters through.
    def montly_distance_params
      if params.dig(:montly_distance, :month).present?
        params[:montly_distance][:month] = DateTime.strptime(params[:montly_distance][:month], "%Y-%m")
      end

      params.expect(montly_distance: [ :month, :distance ])
    end
end
