require 'rails_helper'

RSpec.describe Pasv, type: :model do
  subject {
    described_class.new queries_fname: "queries.fa",
                        refs_fname:    "refs.fa",
                        aligner:       "clustalo",
                        roi_start:     -1,
                        roi_end:       -1
  }

  it { is_expected.to validate_presence_of :queries_fname }
  it { is_expected.to validate_presence_of :refs_fname }
  it { is_expected.to validate_presence_of :aligner }
  it { is_expected.to validate_presence_of :roi_start }
  it { is_expected.to validate_presence_of :roi_end }

  describe "#to_s" do
    it "returns all the values as a string" do
      expected = "queries_fname: '#{subject.queries_fname}', " \
      "refs_fname: '#{subject.refs_fname}', " \
      "aligner: '#{subject.aligner}', " \
      "roi_start: '#{subject.roi_start}', " \
      "roi_end: '#{subject.roi_end}'"

      expect(subject.to_s).to eq expected
    end
  end
end
