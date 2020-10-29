class Api::V1::ArtistsController < ApplicationController
  before_action :set_artist, only: %i[show update destroy]
  before_action :check_login, only: %i[create]

  def index
    artists = Artist.all
    render json: artists
  end

  def create
    artist = current_user.artists.build(artist_params)
    if artist.save
      render json: artist, status: :created
    else
      render json: { errors: artist.errors }, status: :unprocessable_entity
    end
  end

  def show
    render json: @artist
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:id_string)
  end
end
