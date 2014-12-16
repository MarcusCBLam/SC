class PressreleasesController < ApplicationController
  before_action :set_pressrelease, only: [:show, :edit, :update, :destroy]

  # GET /pressreleases
  # GET /pressreleases.json
  def index
    @pressreleases = Pressrelease.all
  end

  # GET /pressreleases/1
  # GET /pressreleases/1.json
  def show
  end

  # GET /pressreleases/new
  def new
    @pressrelease = Pressrelease.new
  end

  # GET /pressreleases/1/edit
  def edit
  end

  # POST /pressreleases
  # POST /pressreleases.json
  def create
    @pressrelease = Pressrelease.new(pressrelease_params)

    respond_to do |format|
      if @pressrelease.save
        format.html { redirect_to @pressrelease, notice: 'Pressrelease was successfully created.' }
        format.json { render :show, status: :created, location: @pressrelease }
      else
        format.html { render :new }
        format.json { render json: @pressrelease.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pressreleases/1
  # PATCH/PUT /pressreleases/1.json
  def update
    respond_to do |format|
      if @pressrelease.update(pressrelease_params)
        format.html { redirect_to @pressrelease, notice: 'Pressrelease was successfully updated.' }
        format.json { render :show, status: :ok, location: @pressrelease }
      else
        format.html { render :edit }
        format.json { render json: @pressrelease.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pressreleases/1
  # DELETE /pressreleases/1.json
  def destroy
    @pressrelease.destroy
    respond_to do |format|
      format.html { redirect_to pressreleases_url, notice: 'Pressrelease was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pressrelease
      @pressrelease = Pressrelease.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pressrelease_params
      params.require(:pressrelease).permit(:title, :description, :image, :date, :live)
    end
end
