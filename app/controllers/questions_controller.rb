class QuestionsController < ApplicationController
before_action :authenticate_user!, except: :index

  def index
    @questions = current_user.get_related_questions
    @questions = Question.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @question = Question.new
  end

  def create
    Question.create(create_params)
    redirect_to :root and return
  end


  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end


  private
  def create_params
    params.require(:question).permit(:title).merge(user_id: current_user.id)
  end

end

