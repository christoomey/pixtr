class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
    render :index
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)

    if @gallery.save
      redirect_to gallery_path(@gallery)
    else
      render :new
    end
  end

  def show
    @gallery = load_gallery_from_url
  end

  def edit
    @gallery = load_gallery_from_url
  end

  def update
    @gallery = load_gallery_from_url

    if @gallery.update(gallery_params)
      redirect_to gallery_path(@gallery)
    else
      render :edit
    end
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
