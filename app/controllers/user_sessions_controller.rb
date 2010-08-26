class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  layout 'users'

  def new
    #debugger
    @user_session = UserSession.new
  end

  # ログイン
  def create
    #debugger
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "ログインしました。"
      #debugger
      #redirect_back_or_default user_path
      #render :action => "../users/show"
      #render :template => 'toppage/top'
      redirect_to :controller => "toppage",:action => "top" 
    else
      flash[:notice] = "ログインに失敗しました。"
      render :action => :new
    end
  end

  # ログアウト
  def destroy
    current_user_session.destroy
    flash[:notice] = "ログアウトしました。"
    redirect_back_or_default new_user_session_url
  end

end
