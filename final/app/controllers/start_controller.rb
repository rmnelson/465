class StartController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:upload]
  def index
  end
  def upload
	@file_path = "/tmp/somefile.txt"
	@uploaded_io = params[:file]
	File.open(@file_path, "w+") do |f|
		f.write(@uploaded_io.read)
	end
	render :text => "File has been uploaded successfully"
  end
end
