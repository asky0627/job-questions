class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, user_id: params[:user_id])
    @likes = Like.where(answer_id: params[:answer_id])
    @answers = Answer.all
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, user_id: params[:user_id])
    like.destroy
    @likes = Like.where(answer_id: params[:answer_id])
    @answers = Answer.all
  end
end