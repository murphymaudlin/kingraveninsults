class StaticPagesController < ApplicationController
  def index
    render :index
  end

  def classic
    render :classic
  end

  def complement
    render :complement
  end

  def new_insult
    @insult = generate_insult(params[:type])
    render text: @insult
  end
end
