class PagesController < ApplicationController

def home
        @page_header = "CSCI465 P4: DOI Server"
        @by_line = "I made this! (Ryan Nelson)"
	@doi_bases = DoiBase.all
	@doi_history = DoiHistory.all
	@my_doi_reg = "666"
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

def show
	@doi_base = DoiBase.find(params[:id])
end

def new
	@doi_base = DoiBase.new
end

def create
	@doi_base = DoiBase.new(params.require(:doi_base).permit(:doi_path, :created))
	if @doi_base.save then
		redirect_to @index, notice: 'The new DOI was created'
	else
		render :new
	end
end

end

