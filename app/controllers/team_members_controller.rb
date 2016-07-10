class TeamMembersController < ApplicationController
  before_action :set_team_member, only: [:show, :edit, :update, :destroy]

  def index
    @team_members = TeamMember.all
  end


  def create
    @team_member = TeamMember.new(team_member_params)
    if @team_member.save
      render json: @team_member
    else
      render json: @team_member.errors, status: :unprocessable_entity
    end
  end


  def update
    if @team_member.update(team_member_params)
      render json: @team_member
    else
      render json: @team_member.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @team_member.destroy
    head :no_content
  end

  private

    def set_team_member
      @team_member = TeamMember.find(params[:id])
    end

    def team_member_params
      params.require(:team_member).permit(:name, :email, :mobile, :designation)
    end
end
