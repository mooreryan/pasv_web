class PasvsController < ApplicationController
  before_action :set_pasv, only: [:show, :edit, :update, :destroy]

  # GET /pasvs
  # GET /pasvs.json
  def index
    @pasvs = Pasv.all
  end

  # GET /pasvs/1
  # GET /pasvs/1.json
  def show
  end

  # GET /pasvs/new
  def new
    @pasv = Pasv.new
  end

  # GET /pasvs/1/edit
  def edit
  end

  # POST /pasvs
  # POST /pasvs.json
  def create
    @pasv = Pasv.new(pasv_params)

    respond_to do |format|
      if @pasv.save
        format.html { redirect_to @pasv, notice: 'Pasv was successfully created.' }
        format.json { render :show, status: :created, location: @pasv }
      else
        format.html { render :new }
        format.json { render json: @pasv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pasvs/1
  # PATCH/PUT /pasvs/1.json
  def update
    respond_to do |format|
      if @pasv.update(pasv_params)
        format.html { redirect_to @pasv, notice: 'Pasv was successfully updated.' }
        format.json { render :show, status: :ok, location: @pasv }
      else
        format.html { render :edit }
        format.json { render json: @pasv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pasvs/1
  # DELETE /pasvs/1.json
  def destroy
    @pasv.destroy
    respond_to do |format|
      format.html { redirect_to pasvs_url, notice: 'Pasv was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pasv
      @pasv = Pasv.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pasv_params
      params.require(:pasv).permit(:aligner, :roi_start, :roi_end, :query_file, :ref_file)
    end
end
