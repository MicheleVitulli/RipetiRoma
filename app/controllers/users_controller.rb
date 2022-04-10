class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def insegna_materia
    @materia = Subject.find(params[:id])
    current_user.subjects << @materia
    # @teach = Teach.new(user_id: current_user.id, subject_id: @materia.id )
    redirect_to '/subjects'
  end

  def noninsegna_materia
    @materia = Subject.find(params[:id])
    current_user.subjects.delete(@materia)
    # @teach = Teach.new(user_id: current_user.id, subject_id: @materia.id )
    redirect_to '/subjects'
  end

  def fa_corso
    @student = User.find(params[:id])
    current_user.students << @student
    # @teach = Teach.new(user_id: current_user.id, subject_id: @materia.id )
    redirect_to '/courses'
  end

  def nonfa_corso
    @student = User.find(params[:id])
    current_user.courses.delete(@student)
    # @teach = Teach.new(user_id: current_user.id, subject_id: @materia.id )
    redirect_to '/courses'
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to '/'
  end
end
