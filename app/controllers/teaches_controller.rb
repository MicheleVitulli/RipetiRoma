class TeachesController < ApplicationController
  before_action :set_teach, only: %i[ show edit update destroy ]

  # GET /teaches or /teaches.json
  def index
    @teaches = Teach.all
  end

  # GET /teaches/1 or /teaches/1.json
  def show
  end

  # GET /teaches/new
  def new
    @teach = Teach.new
  end

  # GET /teaches/1/edit
  def edit
  end

  # POST /teaches or /teaches.json
  def create
    @teach = Teach.new(teach_params)

    respond_to do |format|
      if @teach.save
        format.html { redirect_to @teach, notice: "Teach was successfully created." }
        format.json { render :show, status: :created, location: @teach }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teach.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teaches/1 or /teaches/1.json
  def update
    respond_to do |format|
      if @teach.update(teach_params)
        format.html { redirect_to @teach, notice: "Teach was successfully updated." }
        format.json { render :show, status: :ok, location: @teach }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @teach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teaches/1 or /teaches/1.json
  def destroy
    @teach.destroy
    respond_to do |format|
      format.html { redirect_to teaches_url, notice: "Teach was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teach
      @teach = Teach.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teach_params
      params.require(:teach).permit(:teacher_id, :subject_id)
    end
end
