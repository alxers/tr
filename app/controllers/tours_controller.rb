class ToursController < ApplicationController
  def index
    if params[:q].present?
      @tours = Tour.tire.search(params[:q], load: true)
    elsif params[:search].present?
      @tours = Tour.search(params[:search])
    else
      @tours = Tour.all
    end
  end

  def show
    @tour = Tour.find(params[:id])
  end
end
