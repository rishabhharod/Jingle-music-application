class ArtistsController < ApplicationController
  before_action :set_artist, only: [:update,:destroy]
  def create
    artist = Artist.new(artist_params)
    if artist.save
      render json: {message: 'Artist created',artist: artist}, status: :ok
    else
      render json: {error: artist.errors.full_messages}, status: :not_acceptable
    end
  end

  def update
    if @artist.update(artist_params)
      render json: {message: 'Artist updated'}, status: :ok
    else
      render json: {message: @artist.errors.full_messages}, status:	:not_acceptable
    end 
  end

  def destroy
    if @artist.destroy
      render json: {message: 'Artist deleted'}, status: :ok
    else
      render json: {message: @artist.errors.full_messages}, status: :not_found
    end 
  end

  private
  def artist_params
    params.require(:artists).permit(:genre,:name,:biography)
  end

  def set_artist
    @artist = Artist.find_by(id: params[:id])
  end
end
