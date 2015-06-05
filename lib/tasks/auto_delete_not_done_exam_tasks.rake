desc 'Auto delete not done exams after one day'
task delete_not_done_exam: :environment do
  Exam.expired.destroy_all
end