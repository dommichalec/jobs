class Job < ActiveRecord::Base
  def filled?
    available == false
  end
end
