class HomeController < ApplicationController
  before_action :set_link

  def set_link
    @link_name = "登録一覧"
    @link_path = "/login_form"
  end

  def top
    spofify
    flash[:notice] = ""
  end

end