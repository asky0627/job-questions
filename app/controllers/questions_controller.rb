class QuestionsController < ApplicationController
before_action :authenticate_user!, except: :index
 def index
  @questions = current_user.questions
 end
 def new
  @question = Question.new
 end
  def create
    Question.create(create_params)
    redirect_to :root and return
 end



private
  def create_params
    params.require(:question).permit(:title).merge(user_id: current_user.id)
  end

end
