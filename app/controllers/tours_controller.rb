class ToursController < ApplicationController
  def index
    if params[:engine] == "elastic"
      @tours = Tour.elastic_search(params)
    elsif params[:engine] == "sphinx"
      @tours = Tour.search("#{params[:query]} #{params[:name]} 
                            #{params[:direction]} #{params[:country]}", 
                            :with => {:cost => params[:cost_from]..params[:cost_to]}, 
                            #:match_mode => :any
                            )
    else
      @tours = Tour.all
    end
  end

  def show
    @tour = Tour.find(params[:id])
  end
end
