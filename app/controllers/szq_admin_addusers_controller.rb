class SzqAdminAddusersController < ApplicationController
  def new
    @szq_admin_added_user = SzqAdminAdduser.new
  end

  def create
    @szq_admin_added_user = SzqAdminAdduser.new(szq_admin_added_user_create_params)

    if @szq_admin_added_user.save
      redirect_to "/szq_admin_addusers/#{@szq_admin_added_user.id}/edit"
    else
      redirect_to "/szq_admin_addusers/new"
    end
  end

  def update
    @szq_admin_add_user =  SzqAdminAdduser.find(params[:id])
    if @szq_admin_add_user.update_attributes(szq_admin_added_user_update_params)
      redirect_to "/szq_admin_addusers/#{params[:id]}"
    else
      redirect_to "/szq_admin_addusers/#{params[:id]}/edit"
    end
  end

  def edit
    @szq_admin_add_user =  SzqAdminAdduser.find(params[:id])
  end

  private
    def szq_admin_added_user_create_params
      params.require(:szq_admin_adduser).permit(:card_id, :name)
    end

    def szq_admin_added_user_update_params
      params.require(:szq_admin_adduser).permit(:tel, :address)
    end
end
