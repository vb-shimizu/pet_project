class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :except => [:new, :create]

  def show
    @user = @current_user
  end

  def new
    debugger
    @user = User.new
  end

  def edit
    @user = @current_user
  end

  def create
    debugger
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'ユーザを新規作成しました。'
      redirect_back_or_default users_url
    else
      render :action => "new"
    end
  end

  def update
    @user = @current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = 'ユーザを更新しました。'
      redirect_back_or_default users_url
    else
      render :action => "edit"
    end
  end

  def destroy
    @user = @current_user
    @user.destroy
    flash[:notice] = 'ユーザを削除しました。'
    redirect_to(new_user_url)
  end
end
