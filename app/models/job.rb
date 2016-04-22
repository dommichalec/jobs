# Job class
class Job < ActiveRecord::Base
  # validations
  validates :title, :how_apply, presence: true
  validates :description, length: { in: 1..500 }
  validates :time_spent_in_office, numericality: { greater_than_or_equal_to: 0 }
  validates :available_positions, numericality: { greater_than_or_equal_to: 1 }

  belongs_to :company

  # class and instance methods
  def self.last_updated
    order('updated_at desc')
  end

  def still_available?
    available
  end
end
