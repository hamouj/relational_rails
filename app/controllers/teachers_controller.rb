class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def show
    @teachers = Teacher.find(params[:id])
  end
end