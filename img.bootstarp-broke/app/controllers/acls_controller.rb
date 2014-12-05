class AclsController < ApplicationController
  before_action :set_acl, only: [:show, :edit, :update, :destroy]
respond_to :html, :xml, :json

  def index
    @image = Image.find(params[:image_id])
    @acls = Acl.all
    respond_with(@acls)
  end

  def show
    #@image = Image.find(params[:image_id])
    respond_with(@acl)
  end

  def new
    @image = Image.find(params[:image_id])
    @acl = Acl.new
    respond_with(@acl)
  end

  def edit
    @image = Image.find(params[:image_id])
  end

  def create
    @acl = Acl.new(acl_params)
    @acl.save
    respond_with(@acl)
  end

  def update
    @acl.update(acl_params)
    respond_with(@acl)
  end

  def destroy
    @acl.destroy
    respond_with(@acl)
  end

  private
    def set_acl
      @acl = Acl.find(params[:id])
    end

    def acl_params
      params.require(:acl).permit(:image_id, :user_id)
    end
end
