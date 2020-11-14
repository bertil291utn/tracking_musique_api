class Api::V1::StatsController < ApplicationController
  before_action :set_stat, only: %i[show update destroy]
  before_action :check_login, only: %i[create]

  def index
    stats = Stat.all
    render json: StatSerializer.new(stats).serializable_hash
  end

  def create
    stat = current_user.artist_stats(params[:id_string]).build(stat_params)
    if stat.save
      render json: StatSerializer.new(stat).serializable_hash, status: :created
    else
      render json: { errors: stat.errors }, status: :unprocessable_entity
    end
  end

  def show
    render json: StatSerializer.new(@stat).serializable_hash
  end

  private

  def set_stat
    @stat = Stat.find(params[:id])
  end

  def stat_params
    params.require(:stat).permit(:hours, :track_name, :spotify_track_id)
  end
end
