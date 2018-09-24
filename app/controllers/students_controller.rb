class StudentsController < ApplicationController
  before_action :require_user , except: [:destroy]
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
    else
      render 'new'
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to students_path
    else
      render 'edit'
    end

  end

  def index
    @students = Student.all
  end

  def destroy
    @student = Student.find(params[:id])
    p "Terminating #{@student.full_name}"
    @student.destroy
    respond_to do |format|
      format.js
      format.html { p 'html response'; redirect_to students_path }
    end
  end


  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :age, :education, :cohort_id)
  end
end
