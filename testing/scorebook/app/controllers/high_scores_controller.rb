class HighScoresController < ApplicationController
 # GET /high_scores
 def index
  @high_scores = HighScore.all
 end
end
