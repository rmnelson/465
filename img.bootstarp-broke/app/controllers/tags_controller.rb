class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
respond_to :html, :xml, :json

  def index
    @tags = Tag.all
    respond_with(@tags)
  end

  def show
    @image = image.find(params[:image_id])
    respond_with(@tag)
  end

  def new
    @tag = Tag.new
    respond_with(@tag)
  end

  def edit
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save
    respond_with(@tag)
  end

  def update
    @tag.update(tag_params)
    respond_with(@tag)
  end

  def destroy
    @tag.destroy
    respond_with(@tag)
  end

  private
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def tag_params
      params.require(:tag).permit(:tag_string, :image_id)
    end
end
