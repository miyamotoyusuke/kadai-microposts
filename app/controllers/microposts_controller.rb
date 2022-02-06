class MicropostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = 'メッセージを投稿しました'
      redirect_to root_url
    
    else
      @pagy, @micropost = pagy(current_user.microposts.order(id: :desc))
      flash.now[:danger] = 'メッセージの投稿に失敗しました'
      render 'toppages/index'
    end
  end

  def destroy
    @micripost.destroy
    flash.now[:danger] = 'メッセージの投稿に失敗しました'
    redirect_back(fallback_location: root_url)
    
  end
  
  private
  
  def micropost_params
    params.require(:micropost).permit(:content)
  end
  
  def correct_user
    @micropost = current_user.feed_microposts.find_by(id: params[:id])
    unless @micripost
    redirect_to root_url
    end
  end
end
