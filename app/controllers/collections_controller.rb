class CollectionsController < ApplicationController
  def create
    collection = Collection.new(collection_params)
    if collection.save
      render json: {message: 'Collection created', collection: collection}, status: :ok
    else
      render json: {message: collection.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    if @collection.update
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
