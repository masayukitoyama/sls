class Batch::Base
  def initialize(batch_type: nil)
    @logger = Rails.application.config.batch_logger
    @logger.progname = self.class.name
    Rails.logger = @logger

    unless batch_type
      raise "batch_type is needed!"
    end
    @batch_status = BatchStatus.find_or_create(batch_type)
  end

  def execute
    begin
      before_log
      self.process
    rescue => ex
      error_log ex
      raise ex
    ensure
      after_log
    end
  end

  def process
    # override
  end

  def logger
    Rails.logger
  end

  def before_log
    logger.info "batch execute start"
  end

  def after_log
    logger.info "batch execute end"
  end

  def error_log(ex)
    logger.error convert_error_message(ex)
  end


  def convert_error_message(ex)
    ex.backtrace.inject("#{ex.to_s}, ") { |error_message, trace| error_message += trace }
  end
end
