class ImageUsersController < ApplicationController
  before_action :set_image_user, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  def index
    @image_users = ImageUser.all
    respond_with(@image_users)
  end

  def show
    respond_with(@image_user)
  end

  def new
    @image_user = ImageUser.new
    respond_with(@image_user)
  end

  def edit
  end

  def create
    @image_user = ImageUser.new(image_user_params)
    @image_user.save
    respond_with(@image_user)
  end

  def update
    @image_user.update(image_user_params)
    respond_with(@image_user)
  end

  def destroy
    @image_user.destroy
    respond_with(@image_user)
  end

  private
    def set_image_user
      @image_user = ImageUser.find(params[:id])
    end

    def image_user_params
      params.require(:image_user).permit(:image_id, :user_id, :Image_id, :User_id)
    end
end
