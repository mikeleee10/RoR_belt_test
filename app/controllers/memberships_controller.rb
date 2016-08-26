class MembershipsController < ApplicationController
  def create
    current_user.memberships.create(group: Group.find(params[:group_id]))
    redirect_to :back
  end
  def destroy
    Membership.where(user: current_user, group: Group.find(params[:group_id])).destroy_all
    redirect_to :back
  end
end
