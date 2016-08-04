class PagesController < ApplicationController
  def home
    @items = Item.all
  end

  def search
  end
end
