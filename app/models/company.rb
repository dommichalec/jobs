class Company < ActiveRecord::Base
  validates :name, :url, :headquarters_location, :stack, :industry, presence: true
  validates :name, :url, uniqueness: true
  validates :about_us, length: { in: 1..500 }
  validates :size, numericality: { greater_than_or_equal_to: 1 }
  validates :founded_in, numericality: { less_than_or_equal_to: $CURRENT_YEAR }, length: { is: 4 }
end
