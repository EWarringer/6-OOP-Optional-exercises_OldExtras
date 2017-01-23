require 'pry'
class SystemCheckSubmission
  attr_reader :solution, :student
  attr_accessor :grade
  def initialize(solution, student)
    @solution = solution
    @student = student
    @grade = nil
  end

  def assign_grade(grade)
    if [0, 1, 2, 3].include? grade
      @grade = grade
    else
      raise InvalidGradeError
    end
  end

  def graded?
    if @grade.nil?
      false
    else
      true
    end
  end
end

class InvalidGradeError < StandardError
end
