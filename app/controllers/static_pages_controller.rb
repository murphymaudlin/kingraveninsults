class StaticPagesController < ApplicationController
  def index
    render :index
  end

  def classic
    render :classic
  end

  def complement
  end
end
