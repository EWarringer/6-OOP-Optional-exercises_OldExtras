require 'pry'

class Lesson
  attr_accessor :name, :body
  def initialize
    @name = nil
    @body = nil
  end

  def new_lesson(new_name, new_body)
    @name = new_name
    @body = new_body
    "#{@name}, #{@body}"
  end

  def submittable?
    false
  end

  def has_grade?
    false
  end
end

class Article < Lesson
end

class Video < Lesson
  attr_reader :url
  def initialize
    super
    @url = "http://www.google.com"
  end
end

class Challenge < Lesson
  def submittable?
    true
  end
end


class SystemCheck < Lesson
  include Grade
  attr_reader :name, :due_date, :average_grade
  attr_accessor :submissions
  def initialize(name, due_date)
    @name = name
    @due_date = due_date
    @submissions = []
  end

  def has_grade?
    true
  end

  def submittable?
    true
  end

  def add_submission(submission)
    submissions << submission
  end

  def average_grade
    total = 0
    submissions.each do |submission|
      total += submission.grade
    end
    total.to_f/submissions.length
  end

  def did_student_complete_system_check?(student)
    submitted = []
    submissions.each do |submission|
      submitted << submission.student.name
    end
    submitted.include? student.name
  end

end
