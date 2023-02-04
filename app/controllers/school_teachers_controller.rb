class SchoolTeachersController < ApplicationController
  def index
    @school = School.find(params[:id])
    @teachers = @school.teachers
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