class ChessboardsController < ApplicationController
  before_action :set_chessboard, only: [:show, :edit, :update, :destroy]

  # GET /chessboards
  # GET /chessboards.json
  def index
    @chessboards = Chessboard.all
  end

  # GET /chessboards/1
  # GET /chessboards/1.json
  def show
  end

  # GET /chessboards/new
  def new
    @chessboard = Chessboard.new
  end

  # GET /chessboards/1/edit
  def edit
  end

  # POST /chessboards
  # POST /chessboards.json
  def create
    @chessboard = Chessboard.new(chessboard_params)

    respond_to do |format|
      if @chessboard.save
        format.html { redirect_to @chessboard, notice: 'Chessboard was successfully created.' }
        format.json { render :show, status: :created, location: @chessboard }
      else
        format.html { render :new }
        format.json { render json: @chessboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chessboards/1
  # PATCH/PUT /chessboards/1.json
  def update
    respond_to do |format|
      if @chessboard.update(chessboard_params)
        format.html { redirect_to @chessboard, notice: 'Chessboard was successfully updated.' }
        format.json { render :show, status: :ok, location: @chessboard }
      else
        format.html { render :edit }
        format.json { render json: @chessboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chessboards/1
  # DELETE /chessboards/1.json
  def destroy
    @chessboard.destroy
    respond_to do |format|
      format.html { redirect_to chessboards_url, notice: 'Chessboard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chessboard
      @chessboard = Chessboard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chessboard_params
      params.require(:chessboard).permit(:dimension, :theme)
    end
end
