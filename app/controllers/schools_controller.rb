class SchoolsController < ApplicationController
  def index
    @schools = School.order_schools
  end

  def show
    @school = School.find(params[:id])
    @count = @school.teacher_count
  end

  def new
  end

  def create
    school = School.create!(school_params)
    school.save
    redirect_to "/schools/#{school.id}"
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])
    @school.update(school_params)
    redirect_to "/schools/#{@school.id}/teachers"
  end

private 
  def school_params
    params.permit(:name, :open_year, :fully_staffed)
  end
end