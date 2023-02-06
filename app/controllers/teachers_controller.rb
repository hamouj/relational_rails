class TeachersController < ApplicationController
  def index
    if params[:filter] == "bilingual"
      @teachers = Teacher.show_bilingual_teachers
    else
      @teachers = Teacher.all
    end
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    @teacher.update(teacher_params)

    redirect_to "/teachers/#{@teacher.id}"
  end

private 
  def teacher_params
    params.permit(:name, :years_at_school, :bilingual, :school_id, :created_at, :updated_at)
  end
end