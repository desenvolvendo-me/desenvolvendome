#TODO: Factoring esse controller
class ComparesController < ApplicationController

  def new
    @compare = Compare.new
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).includes(:profile).page params[:page]
  end

  def create
    user1 = User.find_by_login(compare_params[:login_1])
    user2 = User.find_by_login(compare_params[:login_2])

    manager_compare(user1, user2)

    respond_to do |format|
      if user1 and user2
        @compare.save!
        format.html {redirect_to compare_path(login_1: @compare.user.login, login_2: @compare.compared.login)}
      else
        format.html {redirect_to :compare_new, notice: alert_user_not_exist(user1, user2)}
      end
    end
  end

  def show
    @user = User.find_by_login(params[:login_1])
    @compared = User.find_by_login(params[:login_2])
  end

  private

  def manager_compare(user1, user2)
    @compare = Compare.where(user: user1, compared: user2).take
    if @compare
      count = @compare.comparations_count.to_i + 1
      @compare.update!(comparations_count: count)
    else
      @compare = Compare.new(user: user1, compared: user2)
    end
  end

  def alert_user_not_exist(user1, user2)
    if compare_params[:login_1].present? or compare_params[:login_2].present?
      if !user1 and !user2
        "Os dois logins não foram avaliados!"
      elsif !user1
        "O login <b>#{compare_params[:login_1]}</b> não foi avaliado!"
      elsif !user2
        "O login <b>#{compare_params[:login_2]}</b> não foi avaliado!"
      end
    else
      "Nenhum login pode ficar vazio."
    end
  end

  def compare_params
    params.require(:compare).permit(:login_1, :login_2)
  end


end
