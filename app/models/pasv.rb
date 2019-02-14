class Pasv < ApplicationRecord
  validates_presence_of :queries_fname,
                        :refs_fname,
                        :aligner,
                        :roi_start,
                        :roi_end
end
