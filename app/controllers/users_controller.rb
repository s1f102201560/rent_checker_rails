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
      redirect_to @user, notice: t('messages.create.notice')
    else
      render :new, alert: t('messages.create.alert'), status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(permit_params)
      redirect_to @user, notice: t('messages.update.notice')
    else
      render :edit, alert: t('messages.update.alert'), status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_path, notice: t('messages.destroy.notice')
    else
      redirect_to users_path, alert: t('messages.destroy.alert')
    end
  end

  private

  def permit_params
    params.require(:user).permit(:name, :email)
  end
end