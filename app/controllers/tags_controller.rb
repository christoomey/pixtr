class TagsController < ApplicationController
  def index
    @new_tag = Tag.new
    @tags_with_images, @orphaned_tags = Tag.all.partition do |tag|
      tag.image_count > 0
    end
    @tags_with_images.sort_by!(&:image_count).reverse!
  end

  def create
    @new_tag = Tag.new(tag_params)
    if @new_tag.save
      redirect_to tags_path
    else
      @tags = Tag.all
      render :index
    end
  end

  def show
    @tag = Tag.find_by(text: params[:id])
    @images = @tag.images
  end

  private

  def tag_params
    params.require(:tag).permit(:text)
  end
end
