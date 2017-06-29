class UsersController < ApplicationController
  def index
    if cookies[:fav]
      fav = cookies[:fav].split('&')
      @fav = Diy.where(id: fav).order("id DESC").page(params[:page]).per(6)
    end
  end
end
