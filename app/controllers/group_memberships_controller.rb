class GroupMembershipsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @group.members << current_user

    redirect_to groups_path
  end
end
