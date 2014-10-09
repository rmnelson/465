class PagesController < ApplicationController
load "#{Rails.root}/lib/ladder.rb"
def home
	@greeting = "Home action says: Hello world!"	
 end
end
