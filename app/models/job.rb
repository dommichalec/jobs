class Job < ActiveRecord::Base
  belongs_to :company
  def filled?
    available == false
  end

  def self.last_updated
    order('updated_at desc')
  end
end
