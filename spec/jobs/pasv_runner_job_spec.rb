require 'rails_helper'

RSpec.describe PasvRunnerJob, type: :job do
  subject { described_class.new }

  describe '#perform' do
    it 'says hello' do
      pasv = Pasv.new aligner:   "clustalo",
                      roi_start: -1,
                      roi_end:   -1

      expected = "aligner: '#{pasv.aligner}', " \
      "roi_start: '#{pasv.roi_start}', " \
      "roi_end: '#{pasv.roi_end}'"

      expect(subject.perform pasv).to eq expected
    end
  end
end
