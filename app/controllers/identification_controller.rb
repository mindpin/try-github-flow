class IdentificationController < ApplicationController
  def new
    @identification=Identification.new
  end

  def create
    @name = params[:NAME]
    @identical_id = params[:IDENTICAL_ID]
    @identification = Identification.new(:name=>@name,:identical_id=>@identical_id)

    if @identification.save
      redirect_to '/supply?id='+@identification.identical_id, notice: '成功创建了需求'
    else
     render :new
    end
  end

  def supply
     @id = params[:id]
  #   if !@id.blank?
  #     render :supply
  #   else
  #     @address = params[:ADDRESS]
  #     @phonenumber = params[:PHONENUMBER]
  #     @identification = Identification.find(:identical_id=>@id)
  #     @identification.address = @address
  #     @identification.phonenumber = @phonenumber
  #     if @identification.save
  #       render :supply, notice: '补充成功'
  #     else
  #       render :supply, notice: '补充失败'
  #     end
  #   end
   end

   def supply_success
    @id = params[:ID]
    @address = params[:ADDRESS]
    @phonenumber = params[:PHONENUMBER]
    if @id.blank?
      return render :supply_success
    end
    @idf = Identification.where(:identical_id=>@id).first
    if @idf.update_attributes(:address => @address, :phonenumber => @phonenumber)
      render :supply_success
    else
      redirect_to supply_path, notice: '补充失败'
    end
   end


end
