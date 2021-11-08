class RelationshipsController < ApplicationController
  def follow
    @user = User.find(params[:user_id])
  end

  def follower
    @user = User.find(params[:user_id])
  end

   def create
     user = User.find(params[:user_id])
     follower = current_user.follower.new(followed_id: user.id)
     follower.save
     redirect_to request.referer
   end

  def destroy
     user = User.find(params[:user_id])
     follower = current_user.follower.find_by(followed_id: user.id)
     follower.destroy
     redirect_to request.referer
  end
end
