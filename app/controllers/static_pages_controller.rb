class StaticPagesController < ApplicationController
  def index
  end

  def classic
  end
  
  def info
  end

  def complement
    render :complement
  end

  def new_insult
    @insult = generate_insult(params[:type])
    render text: @insult
  end
end
