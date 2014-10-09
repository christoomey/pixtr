class ImagesController < ApplicationController
  def show
    @gallery = load_gallery_from_url
    @image = @gallery.images.find(params[:id])
    @available_tags = Tag.all
    @comment = Comment.new
    @comments = @image.comments.recent
  end

  def new
    @gallery = load_personal_gallery_from_url
    @image = @gallery.images.new
  end

  def create
    @gallery = load_personal_gallery_from_url
    @image = @gallery.images.new(image_params)

    if @image.save
      redirect_to gallery_path(@gallery)
    else
      render :new
    end
  end

  def edit
    @gallery = load_personal_gallery_from_url
    @image = @gallery.images.find(params[:id])
  end

  def update
    @gallery = load_personal_gallery_from_url
    @image = @gallery.images.find(params[:id])
    @tag_ids = parse_tag_ids

    if @image.update(image_params.merge(tag_ids: parse_tag_ids))
      redirect_to gallery_image_path(@gallery, @image)
    else
      render :edit
    end
  end

  private

  def image_params
    params.
      require(:image).
      permit(:name, :url, group_ids: [], tag_ids: [])
  end

  def parse_tag_ids
    tags_string = params[:image][:tag_words]
    tags_string.split(", ").map do |tag_word|
      Tag.find_or_create_by(text: tag_word).id
    end
  end

  def load_gallery_from_url
    Gallery.find(params[:gallery_id])
  end

  def load_personal_gallery_from_url
    current_user.galleries.find(params[:gallery_id])
  end
end
