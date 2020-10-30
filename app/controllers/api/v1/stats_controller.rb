class Api::V1::StatsController < ApplicationController
  before_action :set_stat, only: %i[show update destroy]
  before_action :check_login, only: %i[create]

  def index
    stats = Stat.all
    render json: stats
  end

  def create
    stat = current_user.artists.find(stat_params[:artist_id]).stats.build(stat_params)
    if stat.save
      render json: stat, status: :created
    else
      render json: { errors: stat.errors }, status: :unprocessable_entity
    end
  end

  def show
    render json: @stat
  end

  private

  def set_stat
    @stat = Stat.find(params[:id])
  end

  def stat_params
    params.require(:stat).permit(:hours, :artist_id)
  end
end
