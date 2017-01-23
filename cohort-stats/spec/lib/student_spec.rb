require "spec_helper"

RSpec.describe Student do
  describe ".new" do
    it "takes a name and email as arguments" do
      student = Student.new("Bob Smith", "bob.smith@gmail.com")
      expect(student).to be_a(Student)
    end
  end

  let(:student) { Student.new("Jane Smith", "jane.smith@gmail.com") }

  describe "#name" do
    it "has a reader for name" do
      expect(student.name).to eq("Jane Smith")
    end

    it "does not have a writer for name" do
      expect { student.name = "John Smith" }.to raise_error(NoMethodError)
    end
  end

  describe "#email" do
    it "has a reader for email" do
      expect(student.email).to eq("jane.smith@gmail.com")
    end

    it "does not have a writer for email" do
      expect { student.email = "hax0r@31331.org" }.to raise_error(NoMethodError)
    end
  end
end
