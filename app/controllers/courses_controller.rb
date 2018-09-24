class CoursesController < ApplicationController
  before_action :require_user, except: [:destroy]
  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path
    else
      render 'new'
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to courses_path
    else
      render 'edit'
    end

  end

  def index
    @courses = Course.all
  end

  def destroy
    @course = Course.find(params[:id])
    p "Terminating #{@course.name}"
    @course.destroy
    respond_to do |format|
      format.js
      format.html { p 'html response'; redirect_to cohorts_path }
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :total_hours)
  end
end
