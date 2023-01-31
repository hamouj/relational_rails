class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def show
    @schools = School.find(params[:id])
  end
end