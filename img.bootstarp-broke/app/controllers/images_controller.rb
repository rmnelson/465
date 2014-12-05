class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  def index
    @images = Image.all
    respond_with(@images)
  end

  def show
    respond_with(@image)
  end

  def new
    @image = Image.new
    respond_with(@image)
  end

  def edit
  end

  def create
    @image = Image.new(image_params)
    @image.user = current_user

    @uploaded_io = params[:image][:uploaded_file]
    #@image.filename = rand(10**8).to_s + ".jpg" 
    @image.filename = @uploaded_io.original_filename 

    File.open(Rails.root.join('public', 'images', @image.filename), 'wb') do |file|
        file.write(@uploaded_io.read)
    end

    if @image.save
      redirect_to @image, notice: 'Image was successfully created.'
    else
      render :new
    end
  end

  def update
    @image.update(image_params)
    if(!params[:image][:uploaded_file].nil?) then
	    @uploaded_io = params[:image][:uploaded_file]
	    @image.filename = @uploaded_io.original_filename

	    File.open(Rails.root.join('public', 'images', @image.filename), 'wb') do |file|
        	file.write(@uploaded_io.read)
	    end
    end

    if @image.save
      redirect_to @image, notice: 'Image was successfully updated.'
    end
  end

  def destroy
    @image.destroy
    respond_with(@image)
  end

  def click
    @image = Image.find(params[:image_id])
    @jshide_code ="<script language=\"javascript\" type=\"text/javascript\">
function showHide(shID) {
   if (document.getElementById(shID)) {
      if (document.getElementById(shID+'-show').style.display != 'none') {
         document.getElementById(shID+'-show').style.display = 'none';
         document.getElementById(shID).style.display = 'block';
      }
      else {
         document.getElementById(shID+'-show').style.display = 'inline';
         document.getElementById(shID).style.display = 'none';
      }
   }
}
</script>"
     @some_style = "<style type=\"text/css\">
   /* This CSS is used for the Show/Hide functionality. */
   .more {
      display: none;
      border-top: 1px solid #666;
      border-bottom: 1px solid #666; }
   a.showLink, a.hideLink {
      text-decoration: none;
      color: #36f;
      padding-left: 8px;
      background: transparent url(down.gif) no-repeat left; }
   a.hideLink {
      background: transparent url(up.gif) no-repeat left; }
   a.showLink:hover, a.hideLink:hover {
      border-bottom: 1px dotted #36f; }
</style>"


  end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:filename, :private, :user_id, :original_filename)
    end
end
