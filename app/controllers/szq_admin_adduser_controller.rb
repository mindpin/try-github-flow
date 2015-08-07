class SzqAdminAdduserController < ApplicationController
  def new
    @szqadminadduser = SzqAdminAdduser.new
  end
  
  def create

  end

  def szqadminadduser_params
      params.require(:user).permit(:name, :hashed_password, :salt)
    end
end