class GroupsController < ApplicationController
  def index
    require_login
    @groups = Group.all
  end
  def create
    new_group = current_user.groups.create(name: params[:name], description: params[:description])
    if new_group
      redirect_to '/groups'
    else
      flash[:errors] = 'Invalid group details! Try again!'
      redirect_to '/groups'
    end
  end
  def show
    require_login
    @group = Group.find(params[:id])
  end
end
