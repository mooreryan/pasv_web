require 'rails_helper'

RSpec.describe Pasv, type: :model do
  subject {
    described_class.new aligner:   "clustalo",
                        roi_start: -1,
                        roi_end:   -1
  }

  it { is_expected.to validate_presence_of :aligner }
  it { is_expected.to validate_presence_of :roi_start }
  it { is_expected.to validate_presence_of :roi_end }

  context "file uploads" do
    context "with valid files" do
      it "saves the ref_file" do
        subject.save

        file = File.open Constant::REF_FILE_NAME, "rt"
        name = File.basename Constant::REF_FILE_NAME

        subject.ref_file.attach io: file, filename: name, content_type: "plain/text"

        expect(subject.ref_file).to be_attached
      end

      it "saves the query_file" do
        subject.save

        file = File.open Constant::QUERY_FILE_NAME, "rt"
        name = File.basename Constant::QUERY_FILE_NAME

        subject.query_file.attach io: file, filename: name, content_type: "plain/text"

        expect(subject.query_file).to be_attached
      end
    end
  end

  describe "#to_s" do
    it "returns all the values as a string" do
      expected = "aligner: '#{subject.aligner}', " \
      "roi_start: '#{subject.roi_start}', " \
      "roi_end: '#{subject.roi_end}'"

      expect(subject.to_s).to eq expected
    end
  end

  context "callbacks" do
    it { is_expected.to callback(:run_job).after(:save) }

    describe "#save" do
      it "does the thing" do
        expected = "aligner: '#{subject.aligner}', " \
      "roi_start: '#{subject.roi_start}', " \
      "roi_end: '#{subject.roi_end}'"

        expect do
          subject.save
        end.to output(expected).to_stdout
      end
    end
  end
end
