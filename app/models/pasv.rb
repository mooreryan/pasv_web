require "tempfile"
require 'securerandom'


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

  # This method will run the PASV command line program using the options from the Pasv object.
  #
  # The params are all the same as the CLI demands
  #
  # @note The PASV cli will retry alignments up to 100 times (each?) in order to recover from errors.  Sometimes this will lead to a long running process that eventually just dies.
  def run_pasv_cli
    exit_status = nil
    # We need an outdir.  The PASV CLI creates this dir so we can't create a tmpdir.  Best we can do is try to give it a unique name.
    #
    # %24N yoctosecond (24 digits)
    date_fmt = "%Y_%m_%d_%H_%M_%S_%L_%24N"

    outdir = nil
    # Keep looping until you get a dirname that doesn't currently exist.
    loop do
      time = Time.new.strftime date_fmt
      token = SecureRandom.hex(64)

      # The chances of making a duplicate here from some other thread or OS operation should be LOW
      outdir = File.join Dir.tmpdir, "#{token}_#{time}"

      break unless Dir.exist? outdir
    end



    # First we need to write the files to some Tempfile
    # fsync


    # defaults

    if self.aligner == "clustalo"
      aln_params    = '\--threads 1'
      io_format_str = '\-i %s \-o %s'
    elsif self.aligner == "mafft"
      aln_params    = '\--thread 1 \--quiet'
      io_format_str = '%s > %s'
    end

    p [aln_params, io_format_str]

    Tempfile.open do |ref_f|
      self.ref_file.download do |data|
        ref_f.puts data
      end

      # Ensure the data is actually written to file now.
      ref_f.fsync

      Tempfile.open do |query_f|
        self.query_file.download do |data|
          query_f.puts data
        end

        query_f.fsync

        # And now we build the PASV command while the tempfiles are still in scope.
        cmd = "ruby #{PasvsHelper::PASV_EXE} --refs #{ref_f.path} --queries #{query_f.path} --aligner #{self.aligner} --alignment-parameters '#{aln_params}' --io-format-string '#{io_format_str}' --start #{self.roi_start} --end #{self.roi_end} --threads #{PasvsHelper::THREADS} --outdir #{outdir} --min-count #{PasvsHelper::MIN_COUNT} 500 501"

        puts "Command will be: #{cmd}"

        PasvsHelper::RyaTime.time_it cmd, Rya::AbortIf.logger do
          exit_status = PasvsHelper::RyaProcess.run_it cmd
        end
      end
    end

    # If the exit_status is zero, we need to zip up the tmp folder and give it as a download.
    puts exit_status

    if exit_status.success?
      outdir
    end
  end

  private

  def run_job
    pasv_runner = PasvRunnerJob.new

    return_val = pasv_runner.perform self

    print return_val
  end
end
