class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @items = current_user.items
  end

  def show
    @photos = @item.photos
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)

    if @item.save

      if params[:images]
        params[:images].each do |image|
          @item.photos.create(image: image)
        end
      end

      @photos = @item.photos
      redirect_to edit_item_path(@item)
      flash[:success] = "Review posted!"
    else
      render :new
    end
  end

  def edit
    if current_user.id == @item.user.id
      @photos = @item.photos
    else
      redirect_to root_path, notice: "You just don't do dat!"
    end
  end

  def update
    if @item.update(item_params)

      if params[:images]
        params[:images].each do |image|
          @item.photos.create(image: image)
        end
      end

    flash[:success] = "Item details updated."
    redirect_to edit_item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    render 'test'
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:item_type, :item_name, :description, :price, :address)
    end
end
