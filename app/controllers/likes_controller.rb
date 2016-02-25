class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, answer_id: params[:answer_id])
    @likes = Like.where(answer_id: params[:answer_id])
    answer = Answer.find(params[:answer_id])
    redirect_to question_path(answer.question)
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, answer_id: params[:id])
    like.destroy
    # @likes = Like.where(answer_id: params[:answer_id])
    answer = Answer.find(params[:id])
    redirect_to question_path(answer.question)
  end
end 