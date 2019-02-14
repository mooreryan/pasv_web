class PasvRunnerJob < ApplicationJob
  queue_as :default

  def perform pasv
    pasv.to_s
  end
end
