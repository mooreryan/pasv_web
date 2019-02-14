class Pasv < ApplicationRecord
  validates_presence_of :queries_fname,
                        :refs_fname,
                        :aligner,
                        :roi_start,
                        :roi_end

  after_save :run_job

  def to_s
    "queries_fname: '#{self.queries_fname}', " \
      "refs_fname: '#{self.refs_fname}', " \
      "aligner: '#{self.aligner}', " \
      "roi_start: '#{self.roi_start}', " \
      "roi_end: '#{self.roi_end}'"
  end

  # A test function so that the runner has something to run.
  def test_run
    # sleep 10

    self.to_s
  end

  private

  def run_job
    pasv_runner = PasvRunnerJob.new

    return_val = pasv_runner.perform self

    print return_val
  end
end
