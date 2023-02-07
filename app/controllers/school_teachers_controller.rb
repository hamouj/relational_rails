class SchoolTeachersController < ApplicationController
  def index
    @school = School.find(params[:id])
    if params[:sort]
      @teachers = @school.sort_teachers_alphabetically
    elsif params[:years]
      @teachers = @school.filter_by_years_at_school(params[:years])
    else
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