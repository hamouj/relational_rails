class SchoolTeachersController < ApplicationController
  def index
    @school = School.find(params[:id])
    @teachers = @school.teachers
  end
end