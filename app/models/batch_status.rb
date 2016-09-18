class BatchStatus < ActiveRecord::Base

  enum batch_type: {
    over_due: 1
  }

  def is_running?
    self.is_running == 1
  end

  def execute_start
    self.update(last_started_at: DateTime.now)
    self.is_running = 1
  end

  def execute_end
    self.update(last_ended_at: DateTime.now)
    self.is_running = 0
  end

  def self.find_or_create(batch_type)
    batch_status = self.where(batch_type: batch_type)
    unless batch_status
      batch_status = BatchStatus.new(batch_type: batch_type)
      batch_status.save
    end
    batch_status
  end
end
