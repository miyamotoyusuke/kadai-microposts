class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.like(micropost)
    flash[:success] = '投稿をお気に入りに追加しました'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unlike(micropost)
    flash[:danger] = '投稿をお気に入りから削除しました'
    redirect_back(fallback_location: root_url)
  end
end
