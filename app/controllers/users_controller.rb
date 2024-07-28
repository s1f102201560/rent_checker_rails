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
    if @user.save
      redirect_to @user, notice: 'ユーザが作成されました。'
    else
      flash.now[:alert] = 'ユーザーの作成に失敗しました。'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(permit_params)
      redirect_to @user, notice: 'ユーザが更新されました。'
    else
      flash.now[:alert] = 'ユーザーの更新に失敗しました。'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_path, notice: 'ユーザが削除されました。'
    else
      redirect_to users_path, alert: 'ユーザーの削除に失敗しました。'
    end
  end

  private

  def permit_params
    params.require(:user).permit(:name, :email)
  end
end