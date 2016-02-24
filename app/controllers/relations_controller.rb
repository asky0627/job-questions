class RelationsController < ApplicationController

  def create
 user = User.find(params[:target_id])
    current_user.follow(user)
    redirect_to :back
  end

  def destroy
    user = Relationship.find(params[:from_id]).followed
    current_user.unfollow(user)
    redirect_to :back
  end


private

  def create_params
  end

end
