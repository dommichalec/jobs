# Company class
class Company < ActiveRecord::Base
  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" } #, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  validates :name, :url, :headquarters_location, :stack, :industry, presence: true
  validates :name, :url, uniqueness: true
  validates :about_us, length: { in: 1..500 }
  validates :open_source_projects_url, uniqueness: true
  validates :size, numericality: { greater_than_or_equal_to: 1 }
  validates :founded_in, numericality: { less_than_or_equal_to: $CURRENT_YEAR }, length: { is: 4 }

  has_many :jobs, dependent: :destroy
end
