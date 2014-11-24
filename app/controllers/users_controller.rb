class UsersController < ApplicationController
  #layout 'standard'
  def index

  end
  def list
    @user = User.all
  end
  def create

  end
  def update
    
  end
  def add
    user = User.new
    user.name = params[:user][:name]
    if(user)
      user.save!
    end
   
    #end
    redirect_to :action => 'list'
  end
  def add_form
    @add_user = User.new
  end
  def delete_form
    @delete_user = User.new
  end
  def delete
    user = User.find_by_name(params[:user][:name])
    if(user)
      user.destroy!
      user.save!
    end
    redirect_to :action => "list"
  end
  
end
