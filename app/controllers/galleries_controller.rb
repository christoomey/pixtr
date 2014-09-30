class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
    render :index
  end

  def new
    @gallery = Gallery.new
    render :new
  end

  def create
    Gallery.create(gallery_params)

    redirect_to "/"
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    gallery = Gallery.find(params[:id])

    gallery.update(gallery_params)

    redirect_to "/"
  end

  def destroy
    gallery = Gallery.find(params[:id])
    gallery.destroy

    redirect_to "/"
  end

  private

  def gallery_params
    params.require(:gallery).permit(:name, :description)
  end
end
