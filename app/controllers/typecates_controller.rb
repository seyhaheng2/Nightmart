class TypecatesController < ApplicationController
  before_action :set_typecate, only: [:show, :edit, :update, :destroy]

  # GET /typecates
  # GET /typecates.json
  def index
    @typecates = Typecate.all
  end

  # GET /typecates/1
  # GET /typecates/1.json
  def show
  end

  # GET /typecates/new
  def new
    @typecate = Typecate.new
  end

  # GET /typecates/1/edit
  def edit
  end

  # POST /typecates
  # POST /typecates.json
  def create
    @typecate = Typecate.new(typecate_params)

    respond_to do |format|
      if @typecate.save
        format.html { redirect_to @typecate, notice: 'Typecate was successfully created.' }
        format.json { render :show, status: :created, location: @typecate }
      else
        format.html { render :new }
        format.json { render json: @typecate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /typecates/1
  # PATCH/PUT /typecates/1.json
  def update
    respond_to do |format|
      if @typecate.update(typecate_params)
        format.html { redirect_to @typecate, notice: 'Typecate was successfully updated.' }
        format.json { render :show, status: :ok, location: @typecate }
      else
        format.html { render :edit }
        format.json { render json: @typecate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /typecates/1
  # DELETE /typecates/1.json
  def destroy
    @typecate.destroy
    respond_to do |format|
      format.html { redirect_to typecates_url, notice: 'Typecate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_typecate
      @typecate = Typecate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def typecate_params
      params.require(:typecate).permit(:name, :icon)
    end
end
