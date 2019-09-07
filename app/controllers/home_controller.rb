class HomeController < ApplicationController
  before_action :set_link
  before_action :spofify, only: [:top]

  def set_link
    @link_name = "登録一覧"
    @link_path = "/login_form"
  end

  def top
    flash[:notice] = ""
  end

end