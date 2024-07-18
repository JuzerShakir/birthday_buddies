class ApplicationJob < ActiveJob::Base
  # use solid queue adapter for bg jobs
  self.queue_adapter = :solid_queue

  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError
end
