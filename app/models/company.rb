class Company < ActiveRecord::Base
  validates :name, :headquarters_location, :url, :stack, :industry, presence: true
  validates :open_source_projects_url, allow_blank: true
  validates :about_us, length: { in: 1..500 }
  validates :size, numericality: { greater_than_or_equal_to: 1 }
  validates :founded_in, numericality: { less_than_or_equal_to: $CURRENT_YEAR }, length: { is: 4 }
end
