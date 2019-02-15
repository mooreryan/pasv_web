module PasvsHelper
  # TODO should probably move these into the actual Rails source directory at some point.
  PASV_EXE     = "/Users/moorer/projects/pasv/pasv"
  CLUSTALO_EXE = "/usr/local/bin/mafft"
  MAFFT_EXE    = "/usr/local/bin/clustalo"

  # For the snazzy command line runners.
  RyaProcess = Class.new { extend Rya::CoreExtensions::Process }
  RyaTime = Class.new { extend Rya::CoreExtensions::Time }

  THREADS = 3
  MIN_COUNT = 1
end
