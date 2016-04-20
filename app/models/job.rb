class Job < ActiveRecord::Base
  belongs_to :company
  def filled?
    available == false
  end
end
