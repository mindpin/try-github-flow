class SzqAdminAdduserController < ApplicationController
  def new
    @szqadminadduser = SzqAdminAdduser.new
  end
  
  def create
    @szqadminadduser = SzqAdminAdduser.new(szqadminadduser_params)


    respond_to do |format|
      if @szqadminadduser.save
        format.html { redirect_to  "/szqadminadduser/update"
          }
      else
         format.html { render :new }
      end   
    end
  end

  def update
    
  end
  private
    def szqadminadduser_params
      params.permit(:cardId, :name, :tel, :address)
    end
end