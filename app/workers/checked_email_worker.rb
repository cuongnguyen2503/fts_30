class CheckedEmailWorker
  include Sidekiq::Worker

  def perform exam_id
    exam = Exam.find exam_id
    ExamMailer.checked_exam_notification(exam).deliver_now!
  end
end