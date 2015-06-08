class ExamMailer < ApplicationMailer
  def exam_notification exam
    @exam = exam
    @user = @exam.user
    mail to: @user.email, subject: t("exam_mailer.exam_notification.subject")
  end

  def done_exam_notification exam
    @exam = exam
    admin = User.admins.first
    mail to: admin.email, subject: t("exam_mailer.done_exam_notification.subject")
  end
end
