class Admin::SubjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user
  
  def index
    @subjects = Subject.paginate page: params[:page], per_page: 10
  end

  def show
    @subject = Subject.find params[:id]
    @exams = @subject.exams
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = t :success_flash
      redirect_to admin_subjects_path
    else
      render 'new'
    end
  end

  def edit
    @subject = Subject.find params[:id]
  end

  def update
    @subject = Subject.find params[:id]
    if @subject.update_attributes subject_params
      flash[:success] = t :success_flash
      redirect_to admin_subjects_path
    else
      render 'edit'
    end
  end

  def destroy
    @subject = Subject.find params[:id]
    @subject.destroy
    flash[:success] = t :success_flash
    redirect_to request.referrer || admin_subjects_path
  end

  private

  def subject_params
    params.require(:subject).permit :name
  end 

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end 
end
