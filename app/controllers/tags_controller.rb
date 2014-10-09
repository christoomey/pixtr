class TagsController < ApplicationController
  def index
    @new_tag = Tag.new
    @tags = Tag.all
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
