class Company < ActiveRecord::Base
  # work on possible validation of :open_source_projects_url,
  validates :name, :headquarters_location, :url, :stack, :industry, presence: true
  validates :about_us, length: { in: 1..500 }
  validates :size, numericality: { only_integer: true }
  validates :founded_in, numericality: { only_integer: true }, length: { is: 4 }
end
