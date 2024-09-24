class ArtistsController < ApplicationController
  before_action :set_artist, only: [:update,:destroy,:show]

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
      render json: {erorr: @artist.errors.full_messages}, status: :not_found
    end 
  end

  def show
    if @artist.nil?
      render json: {error: 'No songs found ', detail: @artist.erorrs.full_messages}, status: :not_found
    else
      songs = @artist.songs
    end
  end

  private
  def artist_params
    params.require(:artist).permit(:genre,:name,:biography)
  end

  def set_artist
    @artist = Artist.find_by(id: params[:artist][:id])
  end
end
