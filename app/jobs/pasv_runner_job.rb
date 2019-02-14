class PasvRunnerJob < ApplicationJob
  queue_as :default

  def perform pasv
    pasv.test_run
  end
end
