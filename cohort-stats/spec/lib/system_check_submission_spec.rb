require "spec_helper"

RSpec.describe SystemCheckSubmission do
  describe ".new" do
    it "takes a solution and student as arguments" do
      solution = <<-SOLUTION
        require "sinatra"

        get "/todo" do
          todo = ["learn ruby", "become great"]
          erb :index, locals: { todo: todo }
        end
      SOLUTION
      student = Student.new("Jane Smith", "jane.smith@gmail.com")
      submission = SystemCheckSubmission.new(solution, student)
      expect(submission).to be_a(SystemCheckSubmission)
    end
  end

  let(:submission) do
    student = Student.new("Jane Smith", "jane.smith@gmail.com")
    SystemCheckSubmission.new("binding.pry", student)
  end

  describe "#solution" do
    it "is a string" do
      expect(submission.solution).to be_a(String)
    end

    it "has a reader for solution" do
      expect(submission.solution).to eq("binding.pry")
    end

    it "does not have a writer for solution" do
      expect { submission.solution = "nil" }.to raise_error(NoMethodError)
    end
  end

  describe "#student" do
    it "has a reader for student" do
      expect(submission.student).to be_a(Student)
    end

    it "does not have a writer for student" do
      expect { submission.student = nil }.to raise_error(NoMethodError)
    end
  end

  describe "#assign_grade" do
    it "sets the grade for an submission" do
      grade = Grade::MEETS_EXPECTATIONS
      submission.assign_grade(grade)
      expect(submission.grade).to eq(grade)
    end

    it "raises an error if the grade is invalid" do
      expect { submission.assign_grade(-5000) }.to raise_error(InvalidGradeError)
    end
  end

  describe "#graded?" do
    it "returns 'false' if the submission has not been graded" do
      expect(submission.graded?).to eq(false)
    end

    it "returns 'true' if the submission has been graded" do
      submission.assign_grade(Grade::MEETS_EXPECTATIONS)
      expect(submission.graded?).to eq(true)
    end
  end
end
