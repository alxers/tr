class ToursController < ApplicationController
  def index
    if params[:engine] == "elastic"
      @tours = Tour.tire.search(params[:query], load: true)
    elsif params[:engine] == "sphinx"
      @tours = Tour.search(params[:query])
    else
      @tours = Tour.all
    end
  end

  def show
    @tour = Tour.find(params[:id])
  end
end
