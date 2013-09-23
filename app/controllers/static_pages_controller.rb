class StaticPagesController < ApplicationController
  def index
    render :index
  end
  
  def classic
    render :classic
  end
end
