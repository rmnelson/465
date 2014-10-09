class PagesController < ApplicationController
load "#{Rails.root}/lib/ladder.rb"

def home
	@page_header = "CSCI465 P3: Word Ladder"
	@by_line = "I made this! (Ryan Nelson)"	
	@start_words = dictionary.sample(2)
end
def shazam
	@start_word = params[:start_word]
	@step1 = params[:step1] 
	@step2 = params[:step2] 
	@step3 = params[:step3] 
	@step4 = params[:step4] 
	@step5 = params[:step5] 
	@goal = params[:goal]

	@good = false
	@winning_message = "Sorry you failed!"

	filled_words = Array.new
	filled_words.push(@start_word)

	if !@step1.empty?
		filled_words.push(@step1)
	end
	if !@step2.empty?
		filled_words.push(@step2)
	end
	if !@step3.empty?
		filled_words.push(@step3)
	end
	if !@step4.empty?
		filled_words.push(@step4)
	end
	if !@step5.empty?
		filled_words.push(@step5)
	end
	filled_words.push(@goal)

	@good = legal filled_words
	if @good
		@winning_message = "You have won!"
	end
end
end
