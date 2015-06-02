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
    @exam.results.build
  end

  def update
    @exam = Exam.find params[:id]
    if @exam.update_attributes exam_params
      flash[:success] = t :success_flash
      redirect_to exam_path(@exam)
    else  
      render 'edit'
    end
  end

  def show    
    @exam = Exam.find params[:id]
    @questions = @exam.questions
  end
 
  private

  def exam_params
    params.require(:exam).permit :name, :user_id, :subject_id,
      results_attributes: [:id, :question_id, :option_id, :exam_id]
  end    

  def subjects_select_tag
    @subjects = Subject.all.map{|c| [c.name, c.id]}
  end    
end
