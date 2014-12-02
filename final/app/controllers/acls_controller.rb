class AclsController < ApplicationController
  before_action :set_acl, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @acls = Acl.all
    respond_with(@acls)
  end

  def show
    respond_with(@acl)
  end

  def new
    @acl = Acl.new
    respond_with(@acl)
  end

  def edit
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
      params.require(:acl).permit(:ssid_id, :user_id)
    end
end
