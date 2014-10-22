class PagesController < ApplicationController

def home
        @page_header = "CSCI465 P4: DOI Server"
        @by_line = "I made this! (Ryan Nelson)"
	@doi_bases = DoiBase.all
	@doi_history = DoiHistory.all
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

