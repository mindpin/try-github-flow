class IdentificationController < ApplicationController
  def new
    @identification=Identification.new
  end
  def create
    @name = params[:NAME]
    @identical_id = params[:IDENTICAL_ID]
    @identification=Identification.new(:name=>@name,:identical_id=>@identical_id)
    # p @identification.valid?
    # p @identification.errors
    respond_to do |format|
      if @identification.save

         format.html { redirect_to '/supply?id='+@identification.identical_id, notice: '成功创建了需求' }
         format.html { redirect_to supply_path, notice: '成功创建了需求' }
      else
        format.html { render :new }
      end
    end
  end
  def supply
    respond_to do |format|
      @id=params[:id]
      @address=params[:ADDRESS]
      @phonenumber=params[:PHONENUMBER]


       if @id.blank?
        format.html { render :supply, notice: 'xxx' }
       else
       @identification=Identification.find(:identical_id=>@id)
       @identification.address=@address
       @identification.phonenumber=@phonenumber
          if @identification.save
          # if 1
            render :supply, notice: '补充成功' 
          else
            render :supply, notice: '补充失败' 
          end
       end
  end
end
end