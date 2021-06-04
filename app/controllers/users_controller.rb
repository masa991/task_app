class UsersController < ApplicationController
  def index
    @users = User.all
    @count = "スケジュール合計：　#{User.count}"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:title, :start_day, :end_day, :all_day, :memo))
    if @user.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to :users
    else
      flash[:alert] = "スケジュールを登録できませんでした"
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:title, :start_day, :end_day, :all_day, :memo))
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :users
    else
      flash[:alert] = "スケジュールを更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:alert] = "スケジュールを削除しました"
    redirect_to :users
  end
end
