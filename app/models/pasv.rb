class Pasv < ApplicationRecord
  validates_presence_of :queries_fname,
                        :refs_fname,
                        :aligner,
                        :roi_start,
                        :roi_end

  def to_s
    "queries_fname: '#{self.queries_fname}', " \
      "refs_fname: '#{self.refs_fname}', " \
      "aligner: '#{self.aligner}', " \
      "roi_start: '#{self.roi_start}', " \
      "roi_end: '#{self.roi_end}'"
  end
end
