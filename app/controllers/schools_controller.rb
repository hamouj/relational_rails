class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def show
    @schools = School.find(params[:id])
  end

  def show_teachers
    @schools = School.find(params[:id])
    @schools.show_teachers
  end
end