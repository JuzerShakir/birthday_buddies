class ApplicationJob < ActiveJob::Base
  # use solid queue adapter for bg jobs
  self.queue_adapter = :solid_queue

  before_perform do |job|
    @user, @birthday_buddy = job.arguments
  end

  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError

  private

  def is_birthday_not_today?(birthdate:)
    Time.zone = @user.time_zone
    Time.zone.now.to_date  != birthdate
  end
end
