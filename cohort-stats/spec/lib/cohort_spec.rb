require "spec_helper"

RSpec.describe Cohort do
  describe ".new" do
    it "takes a title, start_date, and end_date as arguments" do
      first_day = Date.parse("2015/08/10")
      last_day = Date.parse("2015/10/16")
      cohort = Cohort.new("Hash Potatoes", first_day, last_day)
      expect(cohort).to be_a(Cohort)
    end
  end

  let(:cohort) do
    Cohort.new("Hash Potatoes", Date.parse("2015/08/10"), Date.parse("2015/10/16"))
  end

  describe "#title" do
    it "has a reader for title" do
      expect(cohort.title).to eq("Hash Potatoes")
    end

    it "does not have a writer for title" do
      expect { cohort.title = "Smash Potatoes" }.to raise_error(NoMethodError)
    end
  end

  describe "#start_date" do
    it "has a reader for start_date" do
      expect(cohort.start_date).to eq(Date.parse("2015/08/10"))
    end

    it "does not have a writer for start_date" do
      expect { cohort.start_date = nil }.to raise_error(NoMethodError)
    end
  end

  describe "#end_date" do
    it "has a reader for end_date" do
      expect(cohort.end_date).to eq(Date.parse("2015/10/16"))
    end

    it "does not have a writer for start_date" do
      expect { cohort.end_date = nil }.to raise_error(NoMethodError)
    end
  end

  describe "#career_day" do
    it "should be a date object" do
      expect(cohort.career_day).to be_a(Date)
    end

    it "should be four days after the end_date" do
      career_day = Date.parse("2015/10/20")
      expect(cohort.career_day).to eq(career_day)
    end

    it "should be different for the winter cohort" do
      start_date = Date.parse("2015/11/09")
      end_date = Date.parse("2016/01/22")
      winter = Cohort.new("Winter 2015", start_date, end_date)

      # Hint: http://ruby-doc.org/stdlib-2.2.3/libdoc/date/rdoc/Date.html#method-i-2B
      expect(winter.career_day).to eq(Date.parse("2016/01/26"))
    end
  end

  describe "#enroll" do
    it "adds a student to the students array" do
      student = Student.new("Jane Smith", "jane.smith@gmail.com")
      cohort.enroll(student)
      expect(cohort.students).to include(student)
    end
  end

  describe "#assign" do
    it "adds a system_check to the system_checks array" do
      due = Date.parse("2015/08/28")
      system_check = SystemCheck.new("Grocery List using Postgres", due)
      cohort.assign(system_check)
      expect(cohort.system_checks).to include(system_check)
    end
  end


  let(:cohort_with_students) do
    student_1 = Student.new("Jane Smith", "jane.smith@gmail.com")
    student_2 = Student.new("John Smith", "john.smith@gmail.com")
    student_3 = Student.new("Jack Smith", "jack.smith@gmail.com")

    cohort.enroll(student_1)
    cohort.enroll(student_2)
    cohort.enroll(student_3)

    cohort
  end

  describe "#roster" do
    <<-EXAMPLE_OUTPUT

      Cohort: Hash Potatoes
      -----------------
      Jane Smith jane.smith@gmail.com
      John Smith john.smith@gmail.com
      Jack Smith jack.smith@gmail.com

    EXAMPLE_OUTPUT

    it "returns a string" do
      expect(cohort_with_students.roster).to be_a(String)
    end

    it "includes the cohort title" do
      expect(cohort_with_students.roster).to include("Hash Potatoes")
    end

    it "includes the student names" do
      expect(cohort_with_students.roster).to include("Jane")
      expect(cohort_with_students.roster).to include("John")
      expect(cohort_with_students.roster).to include("Jack")
    end

    it "includes the student email addresses" do
      expect(cohort_with_students.roster).to include("jane.smith@gmail.com")
      expect(cohort_with_students.roster).to include("john.smith@gmail.com")
      expect(cohort_with_students.roster).to include("jack.smith@gmail.com")
    end
  end

  describe "#system_check_completed?" do
    it "returns 'true' if everyone has submitted" do
      jane = cohort_with_students.students.first
      john = cohort_with_students.students[1]
      jack = cohort_with_students.students.last

      system_check = SystemCheck.new("Grocery List using Postgres", Date.parse("2015/08/28"))
      cohort_with_students.assign(system_check)

      [jane, john, jack].each do |student|
        submission = SystemCheckSubmission.new("binding.pry", student)
        system_check.add_submission(submission)
      end

      expect(cohort.system_check_completed?(system_check)).
        to eq(true)
    end

    it "returns 'false' if we are missing submissions" do
      jane = cohort_with_students.students.first

      system_check = SystemCheck.new("Grocery List using Postgres", Date.parse("2015/08/28"))
      cohort_with_students.assign(system_check)
      submission = SystemCheckSubmission.new("binding.pry", jane)
      system_check.add_submission(submission)

      expect(cohort.system_check_completed?(system_check)).
        to eq(false)
    end
  end
end
