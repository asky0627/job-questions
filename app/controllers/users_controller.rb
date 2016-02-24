class UsersController < ApplicationController
  def index
    @users = User.all
  end


  def show
  @user = User.find(params[:id])
  end
  def edit
  end

  def update
    current_user.update(update_params)
  end
  private
  def update_params
    params.require(:user).permit(:name,:avatar)
  end



# フォローしているユーザーを取得
  def follow
    @friendship[:follow] = @user.following
    # フォローされているユーザーを取得
    @friendship[:follower] = @user.followers
    # フォローしているか調べる
    @user_a.following?(@user_b)
    # フォローされているか調べる
    @user_b.followed_by?(@user_a)
   end

   end

def action_follow
  # ログインチェック
  raise unless current_user

  @user = User.find(params[:requestee_id])

  # 既にフォローしているかチェック
  if current_user.following?(@user)
    render friend_unfollow(@user)
  else
    render friend_follow(@user)
  end

  rescue
  render :json => {:result => "error" }, :status => 400
end

def friend_follow(user)
  current_user.follow(user)
  return  { :json => { :type => "add", :result => "success" } }
  rescue
  return  { :json => { :type => "add", :result => "error" } }
end

def friend_unfollow(user)
  current_user.unfollow(user)
  return  { :json => { :type => "remove", :result => "success" } }
  rescue
  return  { :json => { :type => "remove", :result => "error" } }
end