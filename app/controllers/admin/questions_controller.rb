class Admin::QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user

  def index
    @questions = Question.paginate page: params[:page], per_page: 10
  end

  def new
    @question = Question.new
    4.times {@question.options.build}
  end

  def show
    @question = Question.find params[:id]
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = t :success_flash
      redirect_to admin_questions_path
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find params[:id]
  end

  def update
    @question = Question.find params[:id]
    if @question.update_attributes question_params
      flash[:success] = t :success_flash
      redirect_to admin_questions_path
    else
      render 'new'
    end     
  end

  def destroy
    @question = Question.find params[:id]
    @question.destroy
    flash[:success] = t :success_flash
    redirect_to request.referrer || admin_questions_path
  end

  private

  def question_params
    params.require(:question).permit :content, 
      options_attributes: [:id, :question_id, :content, :correct, :_destroy]
  end     

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end 
end
