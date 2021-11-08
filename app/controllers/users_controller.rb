class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update, :edit]

def ensure_correct_user
	if @current_user.id != params[:id].to_i
		redirect_to user_path(current_user.id)
	end
end


  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @today_book = @books.created_today
    @yesterday_book = @books.created_yesterday
    @day_ratio = @today_book.count / @yesterday_book.count.to_f
    @this_week_book = @books.created_this_week
    @last_week_book = @books.created_lasy_week
    @week_ratio = @this_week_book.count / @yesterday_book.count.to_f
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
