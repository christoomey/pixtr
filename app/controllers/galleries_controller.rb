class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end

  def new
    @gallery = Gallery.new
  end

  def create
    gallery = Gallery.create(gallery_params)
    redirect_to gallery
  end

  def show
    @gallery = load_gallery_from_url
  end

  def edit
    @gallery = load_gallery_from_url
  end

  def update
    gallery = load_gallery_from_url

    gallery.update(gallery_params)

    redirect_to "/"
  end

  def destroy
    gallery = load_gallery_from_url
    gallery.destroy

    redirect_to "/"
  end

  private

  def gallery_params
    params.require(:gallery).permit(:name, :description)
  end

  def load_gallery_from_url
    Gallery.find(params[:id])
  end
end
