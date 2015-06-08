class EmailWorker
  include Sidekiq::Worker

  def perform exam_id, user_id
    exam = Exam.find exam_id
    user = User.find user_id
    ExamMailer.done_exam_notification(exam).deliver_now! if user.normal_user?
  end
end