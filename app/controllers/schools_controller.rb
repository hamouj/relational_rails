class SchoolsController < ApplicationController
  def index
    @schools = School.order_schools
  end

  def show
    @schools = School.find(params[:id])
  end

  def show_teachers
    @school = School.find(params[:id])
    @school_teachers = @school.list_teachers_by_school_id
  end
end