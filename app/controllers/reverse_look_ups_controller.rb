class ReverseLookUpsController < ApplicationController
  before_action :set_reverse_look_up, only: [:show, :edit, :update, :destroy]

  # GET /reverse_look_ups
  # GET /reverse_look_ups.json
  def index
    @reverse_look_ups = ReverseLookUp.all
  end

  # GET /reverse_look_ups/1
  # GET /reverse_look_ups/1.json
  def show
  end

  # GET /reverse_look_ups/new
  def new
    @reverse_look_up = ReverseLookUp.new
  end

  # GET /reverse_look_ups/1/edit
  def edit
  end

  # POST /reverse_look_ups
  # POST /reverse_look_ups.json
  def create
    @reverse_look_up = ReverseLookUp.new(reverse_look_up_params)

    respond_to do |format|
      if @reverse_look_up.save
        format.html { redirect_to @reverse_look_up, notice: 'Reverse look up was successfully created.' }
        format.json { render :show, status: :created, location: @reverse_look_up }
      else
        format.html { render :new }
        format.json { render json: @reverse_look_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reverse_look_ups/1
  # PATCH/PUT /reverse_look_ups/1.json
  def update
    respond_to do |format|
      if @reverse_look_up.update(reverse_look_up_params)
        format.html { redirect_to @reverse_look_up, notice: 'Reverse look up was successfully updated.' }
        format.json { render :show, status: :ok, location: @reverse_look_up }
      else
        format.html { render :edit }
        format.json { render json: @reverse_look_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reverse_look_ups/1
  # DELETE /reverse_look_ups/1.json
  def destroy
    @reverse_look_up.destroy
    respond_to do |format|
      format.html { redirect_to reverse_look_ups_url, notice: 'Reverse look up was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reverse_look_up
      @reverse_look_up = ReverseLookUp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reverse_look_up_params
      params.require(:reverse_look_up).permit(:title, :keyWords, :searchableKeys)
    end
end
