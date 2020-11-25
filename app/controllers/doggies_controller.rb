class DoggiesController < ApplicationController
  before_action :set_doggy, only: [:show, :update, :destroy]

  # GET /doggies
  def index
    @doggies = Doggie.all

    render json: @doggies
  end

  # GET /doggies/1
  def show
    render json: @doggy
  end

  # POST /doggies
  def create
    @doggy = Doggie.new(doggy_params)

    if @doggy.save
      render json: @doggy, status: :created, location: @doggy
    else
      render json: @doggy.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /doggies/1
  def update
    if @doggy.update(doggy_params)
      render json: @doggy
    else
      render json: @doggy.errors, status: :unprocessable_entity
    end
  end

  # DELETE /doggies/1
  def destroy
    @doggy.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doggy
      @doggy = Doggie.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def doggy_params
      params.require(:doggy).permit(:name, :age, :breed)
    end
end
