require 'rails_helper'

RSpec.describe PasvRunnerJob, type: :job do
  subject { described_class.new }

  describe '#perform' do
    it 'says hello' do
      pasv = Pasv.new queries_fname: "queries.fa",
                      refs_fname:    "refs.fa",
                      aligner:       "clustalo",
                      roi_start:     -1,
                      roi_end:       -1

      expected = "queries_fname: '#{pasv.queries_fname}', " \
      "refs_fname: '#{pasv.refs_fname}', " \
      "aligner: '#{pasv.aligner}', " \
      "roi_start: '#{pasv.roi_start}', " \
      "roi_end: '#{pasv.roi_end}'"

      expect(subject.perform pasv).to eq expected
    end
  end
end
