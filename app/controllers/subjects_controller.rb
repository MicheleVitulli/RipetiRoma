# frozen_string_literal: true

require 'pry'

class SubjectsController < ApplicationController
  before_action :set_subject, only: %i[show edit update destroy]
  authorize_resource

  def aggiungi_materia
    @corso = Course.find(params[:id])
    @materia = Subject.find(params[:materia_id])
    @corso.subject = @materia
    redirect_to '/courses' if @corso.save
  end

  # GET /subjects or /subjects.json
  def index
    @subjects = Subject.all
  end

  # GET /subjects/1 or /subjects/1.json
  def show
    @users = User.all
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit; end

  # POST /subjects or /subjects.json
  def create
    @subject = Subject.new(subject_params)
    respond_to do |format|
      if @subject.save
        flash[:success] = "Nuova materia creata correttamente"
        format.html { redirect_to subjects_url}
        format.json { render :index, status: :created, location: @subject }
      else
        
        format.html { render :new }
        
      end
    end
  end

  # PATCH/PUT /subjects/1 or /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to subjects_url, notice: 'Subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1 or /subjects/1.json
  def destroy
    @users = User.all
    @users.each do |utente|
      if utente.subjects.include? @subject
        puts 'Vincolo ELiminato'
        utente.subjects.delete(@subject)
      end
    end
    @subject.destroy
    respond_to do |format|
      flash[:warning] = "Materia eliminata correttamente"
      format.html { redirect_to subjects_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_subject
    @subject = Subject.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def subject_params
    params.require(:subject).permit(:name, :course_id, :subject_id, :materia_id)
  end
end
