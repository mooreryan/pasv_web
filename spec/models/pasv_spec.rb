require 'rails_helper'

RSpec.describe Pasv, type: :model do
  subject do
    described_class.new queries_fname: "queries.fa",
                        refs_fname: "refs.fa",
                        aligner: "clustalo",
                        roi_start: -1,
                        roi_end: -1
  end


  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a queries_fname" do
    subject.queries_fname = nil

    expect(subject).not_to be_valid
  end

  it "is not valid without a refs_fname" do
    subject.refs_fname = nil

    expect(subject).not_to be_valid
  end

  it "is not valid without an aligner" do
    subject.aligner = nil

    expect(subject).not_to be_valid
  end

  it "is not valid without an roi_start" do
    subject.roi_start = nil

    expect(subject).not_to be_valid
  end

  it "is not valid without an roi_end" do
    subject.roi_end = nil

    expect(subject).not_to be_valid
  end
end
