class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new
  end

=begin
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_path, notice: 'Successfully added friend!'
    else
      redirect_to root_path, alert: "Error adding friend: invalid coordinates"
    end
  end
=end

  def create_ajax
    def html_to_real(latitude, longitude)
      
    end


    @user = User.new(:name => params[:name], :latitude => params[:latitude], :longitude => params[:longitude])
    p @user
    if @user.save
      redirect_to root_path, notice: 'Successfully added friend!'
    else
      redirect_to root_path, alert: "Error adding friend: invalid coordinates"
    end
  end

  def nearest_friends
    @user = User.find(params[:id])
    @friends = @user.nearest
  end

  def destroy
    User.delete(params[:id])
    flash[:notice] = 'User deleted'
    redirect_to :action => 'index'
  end
end
