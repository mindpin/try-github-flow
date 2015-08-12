class SzqAdminAdduserController < ApplicationController
  def new
    @szq_admin_added_user = SzqAdminAdduser.new
  end
  
  def create
    @szq_admin_added_user = SzqAdminAdduser.new(szq_admin_added_user_params)
    @id = @szq_admin_added_user.cardId

    respond_to do |format|
      if @szq_admin_added_user.save
        format.html { redirect_to  "/szq_admin_adduser/show?cardId=" + @id.to_s }
      else
        format.html { render :new }
      end   
    end
  end

  def update
    
  end

  def nextIm
    
  end

  def show
    @cardId  = params[:cardId]
    @address = params[:address]
    @tel     = params[:tel]

    if @tel.blank? && @address.blank?
      return render :show
    end
    @szq_admin_add_user =  SzqAdminAdduser.where(:cardId => @cardId).first
    if @szq_admin_add_user.update_attributes(:tel => @tel, :address => @address)
      render :nextIm
    else
      render :show 
    end
  end

  private
    def szq_admin_added_user_params
      params.permit(:cardId, :name, :tel, :address)
    end
end