class RansController < ApplicationController
  before_action :set_ran, only: %i[ show edit update destroy ]

  # GET /rans or /rans.json
  def index
    @rans = Ran.all.ordered
  end

  # GET /rans/1 or /rans/1.json
  def show
  end

  # GET /rans/new
  def new
    @ran = Ran.new
  end

  # GET /rans/1/edit
  def edit
  end

  # POST /rans or /rans.json
  def create
    @ran = Ran.new(ran_params)

    respond_to do |format|
      if @ran.save
        format.html { redirect_to @ran, notice: "Ran was successfully created." }
        format.json { render :show, status: :created, location: @ran }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ran.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rans/1 or /rans/1.json
  def update
    respond_to do |format|
      if @ran.update(ran_params)
        format.html { redirect_to @ran, notice: "Ran was successfully updated." }
        format.json { render :show, status: :ok, location: @ran }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ran.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rans/1 or /rans/1.json
  def destroy
    @ran.destroy!

    respond_to do |format|
      format.html { redirect_to rans_path, status: :see_other, notice: "Ran was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ran
      @ran = Ran.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def ran_params
      params.expect(ran: [ :race_id, :edition, :date, :distance, :homologated, :time, :source ])
    end
end
