class DoiUrlsController < ApplicationController
  before_action :set_doi_url, only: [:show, :edit, :update, :destroy]

  # GET /doi_urls
  # GET /doi_urls.json
  def index
    @doi_urls = DoiUrl.all
  end

  # GET /doi_urls/1
  # GET /doi_urls/1.json
  def show
  end

  # GET /doi_urls/new
  def new
    @doi_url = DoiUrl.new
  end

  # GET /doi_urls/1/edit
  def edit
  end

  # POST /doi_urls
  # POST /doi_urls.json
  def create
    @doi_url = DoiUrl.new(doi_url_params)

    respond_to do |format|
      if @doi_url.save
        format.html { redirect_to @doi_url, notice: 'Doi url was successfully created.' }
        format.json { render :show, status: :created, location: @doi_url }
      else
        format.html { render :new }
        format.json { render json: @doi_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doi_urls/1
  # PATCH/PUT /doi_urls/1.json
  def update
    respond_to do |format|
      if @doi_url.update(doi_url_params)
        format.html { redirect_to @doi_url, notice: 'Doi url was successfully updated.' }
        format.json { render :show, status: :ok, location: @doi_url }
      else
        format.html { render :edit }
        format.json { render json: @doi_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doi_urls/1
  # DELETE /doi_urls/1.json
  def destroy
    @doi_url.destroy
    respond_to do |format|
      format.html { redirect_to doi_urls_url, notice: 'Doi url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doi_url
      @doi_url = DoiUrl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doi_url_params
      params.require(:doi_url).permit(:url, :name, :description, :doi_id)
    end
end
