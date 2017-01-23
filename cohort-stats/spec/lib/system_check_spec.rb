require "spec_helper"

RSpec.describe SystemCheck do
  describe ".new" do
    it "takes a name and due date as arguments" do
      due = Date.parse("2015/08/14")
      system_check = SystemCheck.new("Grocery List in Sinatra", due)
      expect(system_check).to be_a(SystemCheck)
    end
  end

  let(:system_check) do
    due = Date.parse("2015/08/21")
    SystemCheck.new("Grocery List with AJAX", due)
  end

  describe "#submissions" do
    it "is initialized as an empty array" do
      expect(system_check.submissions).to eq([])
    end
  end

  describe "#add_submission" do
    it "takes in a Submission object and stores it" do
      student = Student.new("Jane Smith", "jane.smith@gmail.com")
      solution = <<-SOLUTION
        require "sinatra"
        get "/"
          groceries = ["milk", "eggs", "bread"]
          erb :index, locals: { groceries: groceries }
        end
      SOLUTION
      submission = SystemCheckSubmission.new(solution, student)

      system_check.add_submission(submission)
      expect(system_check.submissions).to include(submission)
    end
  end

  let(:jane) { Student.new("Jane Smith", "jane.smith@gmail.com") }
  let(:john) { Student.new("John Smith", "john.smith@gmail.com") }
  let(:jack) { Student.new("Jack Smith", "jack.smith@gmail.com") }

  describe "#average_grade" do
    it "returns the average score for all submissions" do
      submission_1 = SystemCheckSubmission.new("binding.pry", jane)
      system_check.add_submission(submission_1)
      submission_1.assign_grade(Grade::MEETS_EXPECTATIONS)

      submission_2 = SystemCheckSubmission.new("require 'sinatra'", john)
      system_check.add_submission(submission_2)
      submission_2.assign_grade(Grade::EXCEEDS_EXPECTATIONS)

      submission_3 = SystemCheckSubmission.new("puts 'steak'", jack)
      system_check.add_submission(submission_3)
      submission_3.assign_grade(Grade::DOES_NOT_MEET_EXPECTATIONS)

      sum = Grade::MEETS_EXPECTATIONS
      sum += Grade::EXCEEDS_EXPECTATIONS
      sum += Grade::DOES_NOT_MEET_EXPECTATIONS
      average = sum / 3.0

      expect(system_check.average_grade).to eq(average)
    end
  end

  describe "#did_student_complete_system_check?" do
    it "returns 'true' if a submission exists for that student" do
      system_check = SystemCheck.new("Grocery List using Postgres", Date.parse("2015/08/28"))
      submission = SystemCheckSubmission.new("binding.pry", jane)
      system_check.add_submission(submission)

      expect(system_check.did_student_complete_system_check?(jane)).
        to eq(true)
    end

    it "returns 'false' if submission does not exist for that student" do
      system_check = SystemCheck.new("Grocery List using Postgres", Date.parse("2015/08/28"))
      expect(system_check.did_student_complete_system_check?(jack)).
        to eq(false)
    end
  end


#  EXCEEDS EXPECTATIONS BELOW
  let(:new_check) {SystemCheck.new("Brussels", Date.parse("2015/08/14"))}
  describe "#submittable" do
    it "should be submittable" do
      expect(new_check.submittable?).to eq(true)
    end
  end
  describe "#has_grade?" do
    it "should have a grade" do
      expect(new_check.has_grade?).to eq(true)
    end
  end
end

RSpec.describe Lesson do
  let(:new_lesson) {Lesson.new}
  describe "#new_name" do
    it "should show that name and body are both readable and writeable" do
      expect(new_lesson.new_lesson("groceries", "a new lesson!")).to eq("groceries, a new lesson!")
    end
  end

  describe "#submittable" do
    it "should not be submittable" do
      expect(new_lesson.submittable?).to eq(false)
    end
  end
  describe "#has_grade?" do
    it "should not have a grade" do
      expect(new_lesson.has_grade?).to eq(false)
    end
  end
end


RSpec.describe Article do
  let(:new_article) {Article.new}
  describe "#submittable" do
    it "should not be submittable" do
      expect(new_article.submittable?).to eq(false)
    end
  end
  describe "#has_grade?" do
    it "should not have a grade" do
      expect(new_article.has_grade?).to eq(false)
    end
  end
end


RSpec.describe Challenge do
  let(:new_challenge) {Challenge.new}
  describe "#submittable" do
    it "should be submittable" do
      expect(new_challenge.submittable?).to eq(true)
    end
  end
  describe "#has_grade?" do
    it "should not have a grade" do
      expect(new_challenge.has_grade?).to eq(false)
    end
  end
end

RSpec.describe Video do
  let(:new_video) {Video.new}
  describe "#submittable" do
    it "should not be submittable" do
      expect(new_video.submittable?).to eq(false)
    end
  end
  describe "#has_grade?" do
    it "should not have a grade" do
      expect(new_video.has_grade?).to eq(false)
    end
  end
  it "should have a URL" do
    expect(new_video.url).to eq("http://www.google.com")
  end
end
