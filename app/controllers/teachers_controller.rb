class TeachersController < ApplicationController
  def index
    if params[:filter]
      @teachers = Teacher.show_bilingual_teachers
    elsif params[:keyword]
      @teachers = Teacher.filter_by_keyword(params[:keyword])
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

  def destroy
    teacher = Teacher.find(params[:id])
    teacher.delete
    
    redirect_to "/teachers"
  end

private 
  def teacher_params
    params.permit(:name, :years_at_school, :bilingual, :school_id, :created_at, :updated_at)
  end
end