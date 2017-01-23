require 'pry'

class Cohort
  attr_reader :title, :start_date, :end_date, :career_day
  attr_accessor :students, :system_checks
  def initialize(title, start_date, end_date)
    @title = title
    @start_date = start_date
    @end_date = end_date
    @career_day = end_date + 4
    @students = []
    @system_checks = []
  end

  def enroll(student)
    @students << student
  end

  def assign(system_check)
    @system_checks << system_check
  end

  def roster
    student_array = []
    students.each do |student|
      student_array << "#{student.name} ( #{student.email} )\n"
    end
    " - #{title} -\n#{student_array.join(', ')}"
  end

  def system_check_completed?(system_check)
    no_submission = 0
    students.each do |student|
      if system_check.did_student_complete_system_check?(student) == false
        no_submission += 1
      end
    end
    if no_submission == 0
      return true
    else
      return false
    end
  end
end

# binding.pry
