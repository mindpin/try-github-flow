class MembersController < ApplicationController
  def new
    @member = Member.new
  end

  def index
    @member = Member.all
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to "/members/#{@member.id}/edit"
    else
      redirect_to "/members/new"
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member =  Member.find(params[:id])
    if @member.update_attributes(member_params)
      redirect_to "/members/#{params[:id]}"
    else
      redirect_to "/members/#{params[:id]}/edit"
    end
  end

  def show
    @member = Member.find(params[:id])
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to "/members"
  end

  private
    def member_params
      params.require(:member).permit(:name, :card_id, :phone_num)
    end
end