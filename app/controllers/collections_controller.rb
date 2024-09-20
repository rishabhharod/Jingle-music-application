class CollectionsController < ApplicationController
  def create
    collection = Collection.new(collection_params)
    if collection.save
      render json: {message: 'Collection created', collection: collection}, status: :ok
    else
      render json: {message: collection.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def index
    collections = Collection.all
    if collections.empty?
      render json: {message: 'Pls create collection'}, status: :no_content
    else
      collections.each do |collection|
        songs = collection.playlists
      end
    end
  end

  def show
    collection = Collection.find_by(id: params[:id])
    songs = collection.playlists
  end

  def update
    if @collection.update(collection_params)
      render json: {message: 'Collection updated', collection: @collection}, status: :ok
    else
      render json: {message: @collection.errors.full_messages}, status: :not_found
    end
  end

  def destroy
    if @collection.destroy
      render json: {message: 'Collection has been deleted'}, status: :ok
    else
      render json: {message: @collection.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private
  def collection_params
    params.require(:collection).permit(:title,:description)
  end

  def set_collection
    @collection = Collection.find_by(id: params[:id])
  end
end
