class Admin::ExamsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin_user

  def index
    @exams = Exam.all
  end

  def destroy
    @exam = Exam.find params[:id]
    @exam.destroy
    flash[:success] = t :success_flash
    redirect_to request.referrer || admin_subjects_path 
  end

  def show    
    @exam = Exam.find params[:id]
  end

  def edit
    @exam = Exam.find params[:id]
  end

  def update
    @exam = Exam.find params[:id]
    if @exam.update_attributes exam_params
      CheckedEmailWorker.perform_async @exam.id
      flash[:success] = t :success_flash
      redirect_to admin_exam_path @exam
    else
      flash[:danger] = t :failed_flash
      render :edit
    end
  end

  private

  def exam_params
    params.require(:exam).permit :checked, results_attributes: [:right, :id]
  end

  def check_admin_user
    redirect_to root_url if current_user.normal_user?
  end
end
