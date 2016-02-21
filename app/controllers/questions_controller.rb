class QuestionsController < ApplicationController
before_action :authenticate_user!, except: :index
 def index
  @question = Question.new
 end
 def new
 end

end
