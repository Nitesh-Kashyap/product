# frozen_string_literal: true

class Item < ApplicationRecord
  include LogValidationErrors
  # enum condition: ['like new', 'good', 'very good', 'new']
  # not using enum as keyword new is reserved
  # Alerted error - You tried to define an enum named "condition" on the model "Item", but this will generate a class method "new", which is already defined by Active Record.

  CONDITION = ['new', 'like new', 'good', 'very good'].freeze
  validates :condition, inclusion: { in: CONDITION }
  validates_length_of :productid, in: 10..13
  validates :sku, uniqueness: true
  validates :productid, uniqueness: { scope: :condition,
                                      message: 'Combination of ProductId and Condition is not unique' }

  def condition
    read_attribute(:condition).try(:downcase)
  end
end
