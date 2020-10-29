class Api::V1::ArtistsController < ApplicationController
  before_action :set_artist, only: %i[show update destroy]

  def index
    artists = Artist.all
    render json: artists
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
