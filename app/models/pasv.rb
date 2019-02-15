class Pasv < ApplicationRecord
  validates_presence_of :aligner,
                        :roi_start,
                        :roi_end

  has_one_attached :query_file
  has_one_attached :ref_file

  after_save :run_job

  def to_s
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
