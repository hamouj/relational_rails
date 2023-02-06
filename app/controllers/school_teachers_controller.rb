class SchoolTeachersController < ApplicationController
  def index
    if params[:sort] == "alpha"
      @school = School.find(params[:id])
      @teachers = @school.sort_teachers_alphabetically
    else
      @school = School.find(params[:id])
      @teachers = @school.teachers
    end
  end

  def new
    @school = School.find(params[:id])
  end

  def create
    school = School.find(params[:id])
    new_teacher = Teacher.create!(teacher_params)

    new_teacher.save

    redirect_to "/schools/#{school.id}/teachers"
  end

private 
  def teacher_params
    params.permit(:name, :years_at_school, :bilingual, :school_id)
  end
end