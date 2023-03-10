class SchoolsController < ApplicationController
  def index
    if School.list_names.include?(params[:keyword])
      @schools = School.filter_by_keyword_exact(params[:keyword])
    elsif params[:keyword]
      @schools = School.filter_by_keyword_partial(params[:keyword])
    else
      @schools = School.order_schools
    end
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

    redirect_to "/schools"
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])
    @school.update(school_params)

    redirect_to "/schools/#{@school.id}"
  end

  def destroy
    school = School.find(params[:id])
    school.destroy

    redirect_to '/schools'
  end

private 
  def school_params
    params.permit(:name, :open_year, :fully_staffed)
  end
end