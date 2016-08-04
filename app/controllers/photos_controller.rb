class PhotosController < ApplicationController

  def show
    @photo = Photo.find(params[:id]);
  end

  def destroy
    @photo = Photo.find(params[:id])
    item = @photo.item

    @photo.destroy
    @photos = Photo.where(item_id: item.id)

    respond_to do |format|
      format.js
    end
  end

end
