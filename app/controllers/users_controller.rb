class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(params[:user])
    
    if @user.save
      redirect_to root_url, flash: "#{@user.username} created"
    else
      
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
