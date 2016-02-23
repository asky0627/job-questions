class RelationsController < ApplicationController

  def create
 user = User.find(params[:target_id])
    current_user.follow(user)
    redirect_to user
  end

  def destroy
    user = Relationship.find(params[:from_id]).followed
    current_user.unfollow(user)
    redirect_to user
  end


private

  def create_params
  end

end
