class Api::V1::ArtistsController < ApplicationController
  before_action :set_artist, only: %i[show update destroy]
  before_action :check_login, only: %i[create]
  before_action :check_owner, only: %i[update destroy]

  def index
    artists = Artist.all
    render json: ArtistSerializer.new(artists).serializable_hash
  end

  def create
    artist = current_user.artists.build(artist_params)
    if artist.save
      render json: ArtistSerializer.new(artist).serializable_hash, status: :created
    else
      render json: { errors: artist.errors }, status: :unprocessable_entity
    end
  end

  def show
    render json: ArtistSerializer.new(@artist).serializable_hash
  end

  def update
    if @artist.update(artist_params)
      render json: ArtistSerializer.new(@artist).serializable_hash
    else
      render json: @artist.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @artist.destroy
    head 204
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:id_string)
  end

  def check_owner
    head :forbidden unless @artist.user_id == current_user&.id
  end
end
