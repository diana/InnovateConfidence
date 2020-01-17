class ScenariosController < ApplicationController
  before_action :set_scenario, only: [:show, :update, :destroy]

  # GET /scenarios
  def index
    @scenarios = Scenario.all

    render json: @scenarios
  end

  # GET /scenarios/1
  def show
    @scenario = Scenario.find(params[:game_id])
    render json: @scenario
  end

  # POST /scenarios
  def create
    @scenario = Scenario.new(scenario_params)

    if @scenario.save
      render json: @scenario, status: :created, location: @scenario
    else
      render json: @scenario.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /scenarios/1
  def update
    if @scenario.update(scenario_params)
      render json: @scenario
    else
      render json: @scenario.errors, status: :unprocessable_entity
    end
  end

  # DELETE /scenarios/1
  def destroy
    @scenario.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scenario
      @scenario = Scenario.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def scenario_params
      params.permit(:title, :description, :image, :game_id)
    end
end
