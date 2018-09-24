class InstructorsController < ApplicationController
  before_action :require_user , except: [:new, :create]
  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(instructor_params)
    if @instructor.save
      session[:user_id] = @instructor.id
      redirect_to instructors_path
    else
      render 'new'
    end
  end

  def show
    @instructor = Instructor.find(params[:id])
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def update
    @instructor = Instructor.find(params[:id])
    if @instructor.update(instructor_params)
      redirect_to instructors_path
    else
      render 'edit'
    end
  end

  def index
    @instructors = Instructor.all
  end

  def destroy
    @instructor = Instructor.find(params[:id])
    p "Terminating #{@instructor.full_name}"
    @instructor.destroy
    respond_to do |format|
      format.js
      format.html { p 'html response'; redirect_to instructors_path }
    end
  end

  private



  def instructor_params
    params.require(:instructor).permit(:first_name, :last_name, :age, :salary, :education, :email, :password_digest, :admin)
  end


end
