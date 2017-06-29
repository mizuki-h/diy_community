class DiysController < ApplicationController

  def add
    if cookies[:fav]
      array = cookies[:fav].split('&')
      array << params[:diy_id]
    else
      array = [params[:diy_id]]
    end
    cookies[:fav] = array

    render :text => "OK"
  end

  def index
    @diys = Diy.all.order("id DESC").page(params[:page]).per(9)
    if params[:keyword].present?
      @diys = @diys.where('title LIKE(?)', "%#{params[:keyword]}%")
    end
    if params[:price].present?
      @diys = @diys.where(price: 0..params[:price].to_i)
    end
  end

  def show
    @diy = Diy.find(params[:id])
  end

  def new
    @diy = Diy.new
  end

  def create
  @diy = Diy.new(set_diy)

    if @diy.save
      redirect_to :root
    else
      render :new
    end
  end


  private
  def set_diy
    params.require(:diy).permit(:title, :url, :price, :comment)
  end

end
  