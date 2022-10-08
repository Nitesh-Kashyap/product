# frozen_string_literal: true

module LogValidationErrors
  extend ActiveSupport::Concern

  included do
    after_validation :log_errors, if: proc { |m| m.errors }
  end

  def my_logger
    @@my_logger ||= Logger.new("#{Rails.root}/log/ongraph.log")
  end

  def log_errors
    unless errors.full_messages.blank?
      my_logger.debug "Product - #{title} (#{productid}) Failed to save!\n" + errors.full_messages.map { |i| " - #{i}" }.join("\n")
    end
  end
end
