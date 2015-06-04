class ExamMailer < ApplicationMailer
  def exam_notification exam
    @exam = exam
    @user = @exam.user
    mail to: @user.email, subject: t("exam_mailer.exam_notification.subject")
  end
end
