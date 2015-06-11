desc 'send finish exam requirement email'
task send_finish_exam_email: :environment do
  unfinished_exams = Exam.not_done
  unfinished_exams.each do |exam|
    exist_time = Time.now - exam.created_at
    ExamMailer.exam_notification(exam).deliver_now! unless exist_time < 8.hours
  end
end

desc 'Auto delete not done exams after one day'
task delete_not_done_exam: :environment do
  Exam.expired.destroy_all
end