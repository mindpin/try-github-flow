class LibochaosController < ApplicationController
  before_action :set_libochao, only: [:show, :edit, :update, :destroy]

  # GET /libochaos
  # GET /libochaos.json
  def index
    @libochaos = Libochao.all
  end

  # GET /libochaos/1
  # GET /libochaos/1.json
  def show
  end

  # GET /libochaos/new
  def new
    @libochao = Libochao.new
  end

  # GET /libochaos/1/edit
  def edit
  end

  # POST /libochaos
  # POST /libochaos.json
  def create
    @libochao = Libochao.new(libochao_params)

    respond_to do |format|
      if @libochao.save
        format.html { redirect_to @libochao, notice: 'Libochao was successfully created.' }
        format.json { render :show, status: :created, location: @libochao }
      else
        format.html { render :new }
        format.json { render json: @libochao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /libochaos/1
  # PATCH/PUT /libochaos/1.json
  def update
    respond_to do |format|
      if @libochao.update(libochao_params)
        format.html { redirect_to @libochao, notice: 'Libochao was successfully updated.' }
        format.json { render :show, status: :ok, location: @libochao }
      else
        format.html { render :edit }
        format.json { render json: @libochao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /libochaos/1
  # DELETE /libochaos/1.json
  def destroy
    @libochao.destroy
    respond_to do |format|
      format.html { redirect_to libochaos_url, notice: 'Libochao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_libochao
      @libochao = Libochao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def libochao_params
      params[:libochao]
    end
end
