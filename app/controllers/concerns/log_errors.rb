# frozen_string_literal: true

module LogErrors
  extend ActiveSupport::Concern

  def my_logger
    @@my_logger ||= Logger.new("#{Rails.root}/log/ongraph.log")
  end

  def log_errors(e)
    my_logger.debug e.message unless e.blank?
  end
end
