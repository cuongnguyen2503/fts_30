class ExamsController < ApplicationController
  before_action :authenticate_user!
  before_action :subjects_select_tag, only: [:new]

  def index
    @exams = current_user.exams.paginate page: params[:page]
  end

  def new
    @exam = Exam.new
  end

  def create
    @subject = Subject.find params[:subject_id]
    @exam = current_user.exams.new exam_params
    @exam.subject_id = @subject.id
    if @exam.save
      flash[:success] = t :success_flash
      redirect_to exams_path
    else
      render 'new'
    end
  end

  def edit
    @exam = Exam.find params[:id]
    if @exam.done?
      flash[:success] = t :done_flash
      redirect_to @exam
    end
  end

  def update
    @exam = Exam.find params[:id]
    if @exam.update_attributes exam_params
      EmailWorker.perform_async @exam.id, current_user.id
      flash[:success] = t :success_flash
      redirect_to @exam
    else
      flash[:alert] = t :failed_flash
      render 'edit'
    end
  end

  def show
    @exam = Exam.find params[:id]
  end
 
  private
  def exam_params
    params.require(:exam).permit :name, :user_id, :subject_id, :done, :level,
      :finished, results_attributes: [:id, :answer_content, option_ids: []]
  end

  def subjects_select_tag
    @subjects = Subject.all.map{|subject| [subject.name, subject.id]}
  end
end
