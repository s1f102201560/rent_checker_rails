class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(permit_params)
    @user.save
    redirect_to @user, notice: 'ユーザが作成されました。'
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(permit_params)
    redirect_to @user, notice: 'ユーザが更新されました。'
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'ユーザが削除されました。'
  end

  private

  def permit_params
    params.require(:user).permit(:name, :email)
  end
end