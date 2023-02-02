class SchoolsController < ApplicationController
  def index
    @schools = School.order_schools
  end

  def show
    @school = School.find(params[:id])
    @count = @school.teacher_count
  end
end