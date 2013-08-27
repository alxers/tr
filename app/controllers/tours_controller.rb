class ToursController < ApplicationController
  def index
    if params[:engine] == "elastic"
      @tours = Tour.tire.search "#{params[:query]} #{params[:name]} #{params[:cost]}
                                 #{params[:direction]} #{params[:country]}", load: true
    elsif params[:engine] == "sphinx"
      @tours = Tour.search "#{params[:query]} #{params[:name]} #{params[:direction]} #{params[:country]}", 
                            :with => {:cost => params[:cost_from]..params[:cost_to]}, :match_mode => :any
    else
      @tours = Tour.all
    end
  end

  def show
    @tour = Tour.find(params[:id])
  end
end
