class Api::V1::StatsController < ApplicationController
  before_action :set_stat, only: %i[show update destroy]
  # before_action :check_login, only: %i[create]
  def index
    stats = Stat.all
    render json: stats
  end

  def show
    render json: @stat
  end

  private

  def set_stat
    @stat = Stat.find(params[:id])
  end

  def stat_params
    params.require(:stat).permit(:houra, :day)
  end
end
