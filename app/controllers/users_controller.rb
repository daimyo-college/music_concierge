class UsersController < ApplicationController
  before_action :set_link
  before_action :spofify

  def set_link
    @link_name = "TOPへ戻る"
    @link_path = "/"
  end

  def index
    @users = User.all
    flash[:notice] = ""
  end

  def create
    @user =  User.new(mail_address: params[:mail_address])
    if @user.save
      flash[:notice] = "#{params[:mail_address]}を登録しました"
    elsif params[:mail_address] == ""
      flash[:notice] = "メールアドレスが入力されていません"
    end
    @link_name = "登録一覧"
    @link_path = "/index"
    render("home/top")
  end

  def delete
    @user = User.find_by(mail_address: params[:mail_address])
    if @user
      @user.destroy
      flash[:notice] = "#{params[:mail_address]}を削除しました"
    elsif params[:mail_address] == ""
      flash[:notice] = "メールアドレスが入力されていません"
    else
      flash[:notice] = "存在しないメールアドレスです"
    end
    @link_name = "登録一覧"
    @link_path = "/index"
    render('home/top')
  end

  def delete_from_index
    @user = User.find_by(id: params[:id])
    if @user
      @user.destroy
      flash[:notice] = "#{@user.mail_address}を削除しました"
    elsif params[:mail_address] == ""
      flash[:notice] = "メールアドレスが入力されていません"
    else
      flash[:notice] = "存在しないメールアドレスです"
    end

    @users = User.all
    render('users/index')
  end

  def send_instant
    unless set_dend_flag
      @users = User.all
      render('users/index')
      return
    end

    @user = User.find_by(id: params[:id])

    if @user
      MusicDistributionMailer.instant_delivery(@user).deliver_now
      flash[:notice] = "メールを送信しました"
    else
      flash[:notice] = "存在しないメールアドレスです"
    end

    @users = User.all
    render('users/index')
  end

  def send_album_mail
    if set_dend_flag
      @users = User.all

      @users.each do |user|
        MusicDistributionMailer.regular_delivery(user).deliver_now
      end
    end
  end

  # 本番観葉でのみメール送信にsend_keyパラメータを要求する
  def set_dend_flag
    if Rails.env = "development"
      true
    elsif Rails.env = "production" && ENV["SEND_KEY"] == params[:send_key]
      true
    else
      false
    end
  end

end

